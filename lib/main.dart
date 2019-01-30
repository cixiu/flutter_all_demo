import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/navigator.dart';
import 'route_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('oldWidget $oldWidget');
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
              child: Text('${routeList[index].title} - 已点击 $_count 次'),
              padding: EdgeInsets.all(20.0),
              // fillColor: Colors.lightBlue,
              onPressed: () {
                _buttonPressed(context, routeList[index]);
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
        ),
      );
  }
}
