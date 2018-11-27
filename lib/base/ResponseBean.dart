import 'dart:convert';

abstract class IBean {
  void formJson(String responseJson);
}

class ResponseBean<T extends IBean> extends IBean {
  int code;
  String msg;
  T data;

  ResponseBean(T data) {
    this.data = data;
  }

  void formJson(String responseJson) {
    Map<String, dynamic> jsonMap = json.decode(responseJson);
    code = jsonMap["code"];
    msg = jsonMap["msg"];
    dynamic tempData = jsonMap["data"];
    if (tempData != null) {
      data.formJson(tempData);
    }
  }
}
