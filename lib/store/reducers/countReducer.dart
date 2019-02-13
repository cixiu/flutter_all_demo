import 'package:redux/redux.dart';
import 'package:flutter_all_demo/store/actions/actions.dart';

final countReducer = combineReducers<int>([
  TypedReducer<int, AddCountAction>(_addCountReducer),
  TypedReducer<int, DesCountAction>(_desCountReducer),
]);

int _addCountReducer (int state, AddCountAction action) {
  print('add count');
  return state + action.count;
}

int _desCountReducer (int state, DesCountAction action) {
  print('minus count');
  return state - action.count;
}

// int countReducer(int state, CountAction action) {
//   print(3213);
//   switch(action.type) {
//     case 'Increment':
//       return state + action.count;
//     case 'Decrement':
//       return state - action.count;
//     default:
//       return state;
//   }
// }