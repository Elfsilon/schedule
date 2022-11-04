import 'package:redux/redux.dart';
import 'package:schedule/schedule/models/whole_schedule.dart';
import 'package:schedule/schedule/store/actions/schedule_actions.dart';

WholeSchedule _changeLessonReducer(WholeSchedule state, ChangeScheduleLessonAction action) 
  => state.changeLesson(action.part, action.weekday, action.lessonNumber, action.lessonId);

WholeSchedule _changeSelectedWeekDayReducer(WholeSchedule state, ChangeSelectedWeekDayAction action) 
  => state.changeSelectedWeekDay(action.weekDay);

WholeSchedule _changeSelectedPartReducer(WholeSchedule state, ChangeSelectedPartAction action) 
  => state.changeSelectedPart(action.part);

final scheduleReducer = combineReducers<WholeSchedule>([
  TypedReducer<WholeSchedule, ChangeScheduleLessonAction>(_changeLessonReducer),
  TypedReducer<WholeSchedule, ChangeSelectedWeekDayAction>(_changeSelectedWeekDayReducer),
  TypedReducer<WholeSchedule, ChangeSelectedPartAction>(_changeSelectedPartReducer),
]);