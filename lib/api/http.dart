import 'dart:async';

import 'package:dio/dio.dart';

var dio = Dio();

/// http请求
class HttpRequest {
  static get(String url, { Map<String, dynamic> params}) async {
    Response response = await dio.get(url, queryParameters: params);
    return response.data;
  }

  static Future post(String url, { Map<String, dynamic> data, Map<String, dynamic> params }) async {
    Response response = await dio.post(url, data: data, queryParameters: params);
    return response.data;
  }
}
