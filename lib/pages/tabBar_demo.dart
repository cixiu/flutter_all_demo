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
        color: Colors.white,
        // height: 50.0,
        padding: const EdgeInsets.all(0.0),
        child: TabBar(
          controller: this.tabController,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.blue,
          isScrollable: false,
          // labelPadding: const EdgeInsets.all(0.0),
          tabs: <Widget>[
            Tab(
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
            ),
          ],
        ),
      ),
    );
  }
}
