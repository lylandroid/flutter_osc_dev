import 'dart:async';
import 'package:flutter_osc_dev/base/ResponseBean.dart';
import 'package:flutter_osc_dev/listener/ResponseCallback.dart';

import 'package:http/http.dart' as http;


class HttpUtils {
  static HttpUtils _sHttpUtils;
  Headers mHeaders;

  factory HttpUtils() {
    if (_sHttpUtils == null) _sHttpUtils = HttpUtils._internal();
    return _sHttpUtils;
  }

  HttpUtils._internal() {
    mHeaders = new Headers();
  }

  static HttpUtils getInstance() {
    return _sHttpUtils == null ? new HttpUtils() : _sHttpUtils;
  }

   void get(String url, Map<String, String> prams,IBean iResponseBean, OnResponseCallback onResponseCallback) async {
    //参数拼接
    if (prams != null && prams.isNotEmpty) {
      StringBuffer sb = new StringBuffer(url);
      sb.write("?");
      prams.forEach((key, value) => sb.write("$key=$value&"));
      url = sb.toString().substring(0, sb.length - 1);
    }
    print("HttpUtils get url: ${url}");
    await http.get(url, headers: mHeaders.getHeaders()).then((response) {
      print("HttpUtils get statusCode:${response.statusCode} body: ${response.body}");

      if(iResponseBean != null) iResponseBean.formJson(response.body);

      onResponseCallback(response.statusCode, response.statusCode == 200, response.body, iResponseBean);
    });
   }

  void post(String url, Map<String, String> prams, ResponseCallback listener) async {
    StringBuffer sb = new StringBuffer();
    prams.forEach((key, value) => sb.write("${key}=${value}&"));
    print("HttpUtils post : ${url}?${sb.toString()} ");
    await http.post(url, headers: mHeaders.getHeaders(), body: prams).then((
        response) {
      print("HttpUtils post: ${response.body}");
      if (response.statusCode == 200) {
        listener.onResponse(response);
      } else {
        listener.onFailure(response.statusCode, response.toString(), response);
      }
    });
  }
}

class Headers {
  Map<String, String> mHeaders = {};

  Map<String, String> putHeader(String key, String value) {
    mHeaders["$key"] = value;
    return mHeaders;
  }

  Map<String, String> putHeaders(Map<String, String> headers) {
    mHeaders.addAll(headers);
    return mHeaders;
  }

  Map<String, String> getHeaders() {
    return mHeaders;
  }
}
