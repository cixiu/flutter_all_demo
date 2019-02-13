import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_all_demo/store/reducers/index.dart';
import 'package:flutter_all_demo/store/actions/actions.dart';
import 'package:flutter_all_demo/model/user.dart';

enum Action {
  Increment,
}

class TabBarDemo extends StatefulWidget {
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      vsync: this,
      length: 3,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TabBar Demo'),),
      body: TabBarView(
        controller: this.tabController,
        children: <Widget>[
          StoreConnector<AppState, String>(
            converter: (store) => store.state.count.toString(),
            builder: (context, count) {
              return Text('AAA $count');
            },
          ),
          // Text('AAA'),
          // Text('BBB'),
          StoreConnector<AppState, User>(
            converter: (store) => store.state.userInfo,
            builder: (context, userInfo) {
              return Column(
                children: <Widget>[
                  Text(
                    'BBB ${userInfo.name} ${userInfo.gender} ${userInfo.age} ${userInfo.address}',
                    style: TextStyle(fontSize: 18.0, color: Colors.lightBlue),
                  ),
                  RaisedButton(
                    child: Text('跳过这一年'),
                    onPressed: () {
                      print(UpdateUserAction(User(age: userInfo.age + 1)));
                      StoreProvider.of<AppState>(context).dispatch(UpdateUserAction(User(age: userInfo.age + 1)));
                      // StoreProvider.of<AppState>(context).dispatch(UserAction(type: 'Update', userInfo:User(age: userInfo.age + 1)));
                    },
                  )
                ],
              );
            },
          ),
          StoreBuilder<AppState>(
            builder: (context, store) {
              User userInfo = store.state.userInfo;
              return Text(
                'CCC ${userInfo.name} ${userInfo.gender} ${userInfo.age} ${userInfo.address}',
                style: TextStyle(fontSize: 18.0, color: Colors.red),
              );
            },
          ),
          // Text('CCC'),
        ],
      ),
      bottomNavigationBar: Container(
        // color: Colors.white, /// 写了decoration属性后，color属性要写到decoration中
        height: 50.0,
        padding: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.grey[200])
          )
        ),
        child: TabBar(
          controller: this.tabController,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.blue,
          isScrollable: false,
          // labelPadding: const EdgeInsets.all(0.0),
          tabs: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.home),
                Text('首页', style: TextStyle(fontSize: 12.0),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.phone),
                Text('联系人', style: TextStyle(fontSize: 12.0),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.email),
                Text('邮件', style: TextStyle(fontSize: 12.0),),
              ],
            ),

            /* Tab(
              text: '首页',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: '联系人',
              icon: Icon(Icons.phone),
            ),
            Tab(
              text: '邮件',
              icon: Icon(Icons.email),
            ), */
          ],
        ),
      ),
      floatingActionButton: StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () {
              store.dispatch(DesCountAction());
              // store.dispatch(CountAction(type: 'Decrement'));
          };
        },
        builder: (context, callback) {
          return FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              callback();
            },
            tooltip: 'Decrement count',
          );
        },
      ),
    );
  }
}
