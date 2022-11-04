import 'package:redux/redux.dart';
import 'package:schedule/shared/models/app_state.dart';
import 'package:schedule/store/root_reducer.dart';

Store<AppState> createStore(AppState initialValue) {
  final store = Store<AppState>(rootReducer, initialState: initialValue);
  return store;
}