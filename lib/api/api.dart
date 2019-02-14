import './http.dart';

import 'package:flutter_all_demo/model/article_list.dart';

class Api {
  static Future<Map<String, dynamic>> getArticleList() async {
    final String url = 'https://www.tzpcc.cn/api/article/list';
    // BUG: params必须是Map<String, dynamic /* String|Iterable<String> */>  
    Map<String, dynamic> response = await HttpRequest.get(
        url,
        params: {'offset': '0', 'limit': '10', 'category': 'test'});
    // print(response);
    return response;
  }
}
