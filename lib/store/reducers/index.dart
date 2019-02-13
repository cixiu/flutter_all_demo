import 'package:flutter_all_demo/model/user.dart';
import 'package:flutter_all_demo/store/reducers/countReducer.dart';
import 'package:flutter_all_demo/store/reducers/userReducer.dart';

/// 全局Redux store 的对象，保存State数据
class AppState {
  final int count;
  final User userInfo;

  AppState({ this.count = 0, this.userInfo });
}

/// 通过 Reducer 创建 store 保存的 AppState
AppState appReducer(AppState state, action) {
  return AppState(
    count: countReducer(state.count, action),
    userInfo: userReducer(state.userInfo, action)
  );
}
