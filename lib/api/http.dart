import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

var dio = Dio();

/// http请求
class HttpRequest {
  static Future<T> get<T>(String url, { Map<String, dynamic> params}) async {
    Response<T> response = await dio.get(url, queryParameters: params);
    return response.data;
  }

  static Future post(String url, { Map<String, dynamic> data, Map<String, dynamic> params }) async {
    Response response = await dio.post(url, data: data, queryParameters: params);
    return response.data;
  }
}
