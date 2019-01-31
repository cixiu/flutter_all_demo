import 'package:flutter/material.dart';

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
          Text('AAA'),
          Text('BBB'),
          Text('CCC'),
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
    );
  }
}
