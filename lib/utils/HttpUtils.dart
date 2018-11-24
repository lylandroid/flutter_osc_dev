import 'dart:async';
import 'dart:convert';

import 'package:flutter_osc_dev/listener/ResponseCallback.dart';

import 'package:http/http.dart' as http;
class HttpUtils {
  static Map getHeader() {
    Map headers = new Map();
    return headers;
  }

  static Future<http.Response> get(String url, Map<String, String> prams,
      ResponseCallback listener) async {
    //参数拼接
    if (prams != null && prams.isNotEmpty) {
      StringBuffer sb = new StringBuffer(url);
      sb.write("?");
      prams.forEach((key, value) {
        sb.write("$key=$value&");
      });
      url = sb.toString().substring(0, sb.length - 1);
    }
//    http.Response response = await http.get(url, headers: getHeader());
    return await http.get(url, headers: getHeader()).then((response) {
      print("http get: $response");
      if (response.statusCode == 200){
        listener.onResponse(response);
      }else{
        listener.onFailure(response.statusCode,response);
      }
    });
  }
}
