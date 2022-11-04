import 'package:schedule/schedule/store/reducers/current_lesson_reducer.dart';
import 'package:schedule/schedule/store/reducers/schedule_reducer.dart';
import 'package:schedule/shared/models/app_state.dart';
import 'package:schedule/schedule/store/reducers/lesson_list_reducer.dart';

AppState rootReducer(AppState state, dynamic action) {
  return AppState(
    lessons: lessonReducer(state.lessons, action),
    currentLesson: currentLessonReducer(state.currentLesson, action),
    schedule: scheduleReducer(state.schedule, action),
  );
}