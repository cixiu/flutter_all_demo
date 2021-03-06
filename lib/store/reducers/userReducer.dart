import 'package:redux/redux.dart';
import 'package:flutter_all_demo/model/user.dart';
import 'package:flutter_all_demo/store/actions/actions.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_updateUserInfo)
]);

User _updateUserInfo(User state, UpdateUserAction action) {
  return action.userInfo;
}

// User userReducer(User state, action) {
//   if (action is UserAction) {
//     return action.userInfo;
//   }
//   return state;
// }
