import 'package:dio/dio.dart';
import './http.dart';

class Api {
  static getArticleList() async {
    // BUG: params必须是Map<String, dynamic /* String|Iterable<String> */>  
    var response = await HttpRequest.get(
        'https://www.tzpcc.cn/api/article/list',
        params: {'offset': '0', 'limit': '10', 'category': 'test'});
    print(response);
  }
}
