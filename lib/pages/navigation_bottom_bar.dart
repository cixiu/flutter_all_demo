import 'dart:io';
import 'package:flutter/material.dart';

// 底部导航栏路由
class BottomNavigationBarRouter extends StatefulWidget {
  _BottomNavigationBarRouterState createState() => _BottomNavigationBarRouterState();
}

class _BottomNavigationBarRouterState extends State<BottomNavigationBarRouter> {
  int _currentIndex = 0;
  bool _isOriginNavigationBottomBar = true;

  void _tapBottomNavigation(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('底部导航栏 Demo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(0.0),
        child: ListView(
          children: <Widget>[
            RawMaterialButton( // button 默认最小高度36
              child: Text('原生的底部导航栏'),
              textStyle: TextStyle(color: Colors.white),
              padding: const EdgeInsets.all(14.0),
              // constraints: BoxConstraints(minHeight: 50.0),
              elevation: 0.0,
              fillColor: _isOriginNavigationBottomBar ? Colors.green[500] : Colors.grey[400],
              onPressed: () => setState(() => _isOriginNavigationBottomBar = true),
            ),
            RawMaterialButton(
              child: Text('自定义的底部导航栏'),
              textStyle: TextStyle(color: Colors.white),
              constraints: BoxConstraints(minHeight: 50.0),
              // padding: const EdgeInsets.all(16.0),
              elevation: 0.0,
              fillColor: _isOriginNavigationBottomBar ? Colors.grey[400] : Colors.green[500],
              onPressed: () => setState(() => _isOriginNavigationBottomBar = false),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _isOriginNavigationBottomBar ? _originBottomNavigationBar() : _customBottomNavigationBar(),
    );
  }

  // flutter原生的底部导航栏
  Widget _originBottomNavigationBar() {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            title: Text('联系人')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            title: Text('邮件')
          ),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _tapBottomNavigation,
      );
  }

  // 自定义底部导航栏
  Widget _customBottomNavigationBar() {
    return SafeArea(
      child: SizedBox(
        height: 50.0,
        child: Card(
          color: Platform.isIOS ? Colors.transparent : Colors.white,
          elevation: Platform.isIOS ? 0.0 : 8.0,
          shape: RoundedRectangleBorder(),
          margin: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _customBottomNavigationBarItem(
                      icon: Icons.home,
                      title: '首页',
                      index: 0,
                    ),
                    _customBottomNavigationBarItem(
                      icon: Icons.phone,
                      title: '联系人',
                      index: 1,
                    ),
                    _customBottomNavigationBarItem(
                      icon: Icons.email,
                      title: '邮件',
                      index: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // 自定义底部导航栏的item
  Widget _customBottomNavigationBarItem({ @required IconData icon, @required String title, @required int index }) {
    Color color =
        _currentIndex == index ? Theme.of(context).primaryColor : Colors.grey;
    return Expanded(
      child: InkResponse(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: color),
            Text(title, style: TextStyle(color: color, fontSize: 12.0),)
          ],
        ),
        onTap: () => setState(() => _currentIndex = index),
      ),
    );
  }
}

/**  
 * flutter原生的底部导航栏
 */
// class BottomNavigationBarRouter extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('底部导航栏 Demo'),),
//       body: Center(
//         child: Text('底部导航栏 Demo'),
//       ),
//     );
//   }
// }
