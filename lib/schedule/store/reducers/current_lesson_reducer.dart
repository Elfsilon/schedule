import 'package:redux/redux.dart';
import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/schedule/store/actions/current_lesson_actions.dart';

Lesson? _updateCurrentLessonReducer(Lesson? state, UpdateCurrentLessonAction action) => action.lesson;

final currentLessonReducer = combineReducers<Lesson?>([
  TypedReducer<Lesson?, UpdateCurrentLessonAction>(_updateCurrentLessonReducer),
]);