import 'package:http/http.dart' as http;
import 'package:flutter_osc_dev/base/ResponseBean.dart';

typedef OnResponseCallback<T extends IBean> = void Function(int statusCode,bool isSuccess, String errMsg, T iBean);

typedef OnFailure = void Function(int httpErrCode, String errMsg, dynamic response);

abstract class ResponseCallback<T extends IBean> {
  ResponseBean<T> mResponseBean;

  ResponseCallback(T responseBean)
      : mResponseBean = new ResponseBean(responseBean);

  void onFailure(int httpErrCode, String errMsg, http.Response response) {
    print("ResponseCallback httpErrCode:${httpErrCode} _errMsg:${errMsg}" +
        response.toString());
  }

  void onSuccess(T t);

  void onResponse(http.Response response) {
    print("ResponseCallback onResponse");
    mResponseBean.formJson(response.body);
    if (mResponseBean.code == 0) {
      onSuccess(mResponseBean.data);
    } else {
      onFailure(mResponseBean.code, mResponseBean.msg, response);
    }
  }
}
