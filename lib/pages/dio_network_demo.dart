import 'package:flutter/material.dart';

import 'package:flutter_all_demo/api/api.dart';

import 'package:flutter_all_demo/model/article_list.dart';

class DioNetWordDemo extends StatefulWidget {
  _DioNetWordDemoState createState() => _DioNetWordDemoState();
}

class _DioNetWordDemoState extends State<DioNetWordDemo> {
  _getArticleList() async {

    Map<String, dynamic> response = await Api.getArticleList();
    ArticleList articleList = ArticleList.fromJson(response);
    print('====================================================');
    print('fromJson后的数据 author: ${articleList.data[0].author}');
    print('====================================================');
    var data = articleList.toJson();
    List<Data> resData = data['data'];
    print('toJson后的数据 author: ${resData[0].author}');
    print('====================================================');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio NetWork Demo'),
      ),
      body: Column(
        children: <Widget>[
          Text('http demo'),
          RaisedButton(
            child: Text('点击发送http请求'),
            onPressed: _getArticleList,
          )
        ],
      ),
    );
  }
}
