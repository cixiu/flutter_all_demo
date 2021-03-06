import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';

import 'package:flutter_all_demo/api/interceptors.dart';

// import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_all_demo/model/user.dart';
import 'package:flutter_all_demo/store/reducers/index.dart';
import 'package:flutter_all_demo/store/actions/actions.dart';
import 'route_list.dart';

void main() {
  interceptorsDio();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // init store
  final store = DevToolsStore<AppState>(appReducer, initialState: AppState(userInfo: User(), count: 0));

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(store: store, title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final DevToolsStore<AppState> store;

  MyHomePage({Key key, this.store, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(store);
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {
  final DevToolsStore<AppState> store;

  _MyHomePageState(this.store);

  int _count = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('oldWidget $oldWidget');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('初始化数据');
  }

  void _buttonPressed(BuildContext context, RouteItem item) {
    print('执行了button的点击事件');
    setState(() {
      _count++;
    });
    Navigator.push(context, item.route);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<RouteItem> routeList = getRouteList(context);
    print('执行了build'); // build方法会多次执行

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.separated(
          itemCount: routeList.length,
          itemBuilder: (context, index) {
            return RawMaterialButton(
              // child: Text('${routeList[index].title} - 已点击 $_count 次'),
              
              child: StoreConnector<AppState, String>(
                converter: (store) => store.state.count.toString(),
                builder: (context, count) {
                  return Text(
                    '${routeList[index].title} - 浮动按钮已点击 $count 次',
                    style: TextStyle(color: Colors.redAccent),
                  );
                },
              ),
              padding: EdgeInsets.all(20.0),
              // fillColor: Colors.lightBlue,
              onPressed: () {
                _buttonPressed(context, routeList[index]);
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
        ),
        floatingActionButton: StoreConnector<AppState, VoidCallback>(
          converter: (store) => () => store.dispatch(AddCountAction()),
          builder: (context, callback) {
            return FloatingActionButton(
              onPressed: callback,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          },
        ),
        drawer: Container(
          width: 330.0,
          color: Colors.white,
          child: ReduxDevTools(store),
        ),
      );
  }
}
