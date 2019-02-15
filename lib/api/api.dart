import './http.dart';

import 'package:flutter_all_demo/model/article_list.dart';

class Api {
  static Future<Map<String, dynamic>> getArticleList() async {
    final String url = 'https://www.tzpcc.cn/api/article/list';

    Map<String, dynamic> response = await HttpRequest.get(url,
        params: {'offset': 0, 'limit': 10, 'category': 'test'});
    // print(response);
    return response;
  }

  static Future<Map<String, dynamic>> postLogin() async {
    final String url = 'https://www.tzpcc.cn/user/login';

    Map<String, dynamic> response = await HttpRequest.post(url, data: {
      'username': '滋醒他',
      'password': '123456',
    });

    return response;
  }
}
