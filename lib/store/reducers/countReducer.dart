import 'package:redux/redux.dart';
import 'package:flutter_all_demo/store/actions/actions.dart';

final countReducer = combineReducers<int>([
  TypedReducer<int, AddCountAction>(_addCountReducer),
  TypedReducer<int, DesCountAction>(_desCountReducer),
]);

int _addCountReducer (int state, AddCountAction action) {
  print('add count ${action.count}');
  return state + action.count;
}

int _desCountReducer (int state, DesCountAction action) {
  print('minus count ${action.count}');
  return state - action.count;
}

// int countReducer(int state, action) {
//   if (action is AddCountAction) {
//     return state + action.count;
//   }

//   if (action is DesCountAction) {
//     return state - action.count;
//   }

//   return state;
// }