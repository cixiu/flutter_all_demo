import 'package:flutter/material.dart';

import 'package:flutter_all_demo/api/api.dart';

class DioNetWordDemo extends StatefulWidget {
  _DioNetWordDemoState createState() => _DioNetWordDemoState();
}

class _DioNetWordDemoState extends State<DioNetWordDemo> {
  _getArticleList() {
    Api.getArticleList();
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
