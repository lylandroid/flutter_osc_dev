import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_osc_dev/base/BaseBean.dart';

abstract class ResponseCallback<T> /*extends*/ {
  void onFailure(int responseCode, http.Response response) {
    print("ResponseCallback responseCode: $responseCode " + response.toString());
  }

  void onSuccess(BaseBean<T> data) {

  }

  void onResponse(http.Response response) {
    print("ResponseCallback onResponse");
    
  }
}
