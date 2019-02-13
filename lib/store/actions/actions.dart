import 'package:flutter/foundation.dart';
import 'package:flutter_all_demo/model/user.dart';

class AddCountAction {
  final int count;

  AddCountAction({ this.count = 1 });
}

class DesCountAction {
  final int count;

  DesCountAction({ this.count = 1 });
}

class CountAction {
  final String type;
  final int count;

  CountAction({ @required this.type, this.count = 1 });
}

class UpdateUserAction {
  final User userInfo;

  UpdateUserAction(this.userInfo);
}

class UserAction {
  final String type;
  final User userInfo;

  UserAction({ @required this.type, this.userInfo });
}
