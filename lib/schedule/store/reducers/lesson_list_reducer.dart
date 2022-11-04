import 'package:redux/redux.dart';
import 'package:schedule/schedule/models/lesson_list.dart';
import 'package:schedule/schedule/store/actions/lesson_actions.dart';

LessonList _createLessonReducer(LessonList state, CreateLessonAction action) => state.addItem(action.lesson);

LessonList _updateLessonReducer(LessonList state, UpdateLessonAction action) => state.updateItem(action.lesson);

LessonList _removeLessonReducer(LessonList state, RemoveLessonAction action) => state.removeItem(action.id);

final lessonReducer = combineReducers<LessonList>([
  TypedReducer<LessonList, CreateLessonAction>(_createLessonReducer),
  TypedReducer<LessonList, UpdateLessonAction>(_updateLessonReducer),
  TypedReducer<LessonList, RemoveLessonAction>(_removeLessonReducer),
]);