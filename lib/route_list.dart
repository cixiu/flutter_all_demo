import 'package:flutter/material.dart';
import 'pages/navigation_bottom_bar.dart';
import 'pages/flutter_layout_demo.dart';
import 'pages/tabBar_demo.dart';

class RouteItem {
  final String title;
  final Route route;

  RouteItem({@required this.title, @required this.route});
}

List<RouteItem> getRouteList(BuildContext context) {
  final List<RouteItem> routeList = [];

  return routeList
    ..add(RouteItem(
        title: '底部导航栏',
        route: MaterialPageRoute(
            builder: (BuildContext context) => BottomNavigationBarRouter())))
    ..add(RouteItem(
        title: '布局Demo',
        route: MaterialPageRoute(
            builder: (BuildContext context) => LayoutDemo())))
    ..add(RouteItem(
        title: 'TabBar Demo',
        route: MaterialPageRoute(
            builder: (BuildContext context) => TabBarDemo())));
}
