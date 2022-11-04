import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:schedule/app.dart';
import 'package:schedule/schedule/models/lesson_list.dart';
import 'package:schedule/schedule/models/schedule.dart';
import 'package:schedule/schedule/models/whole_schedule.dart';
import 'package:schedule/shared/models/app_state.dart';
import 'package:schedule/store/create_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveState(AppState state) async {
  print("SAVE STATE");
  final stateMap = state.toMap();
  final stateJson = jsonEncode(stateMap);

  final prefs = await SharedPreferences.getInstance();
  prefs.setString("state", stateJson);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final stateJson = prefs.getString("state");
  
  final AppState state;
  if (stateJson != null) {
    final stateMap = jsonDecode(stateJson);
    state = AppState.fromMap(stateMap);
  } else {
    state = emptyState;
  }

  final store = createStore(state);
  // TODO: Close it
  final saveSubscription = store.onChange.listen(saveState);
  
  runApp(StoreProvider<AppState>(
    store: store,
    child: App(
      subscription: saveSubscription
    ),
  ));
} 

// TODO: Change to func createInitialState
const emptyState = AppState(
  lessons: initialLessons, 
  currentLesson: null, 
  schedule: initialWholeSchedule,
);

const initialWholeSchedule = WholeSchedule(
  selectedPart: 0,
  selectedWeekDay: 0, 
  lessonsStartsAt: 510,
  lessonDuration: 100,
  maxLessonsPerDay: 8,
  breakTime: 20,
  userBreakTime: [null, null, null, null, null, null, null, null],
  items: [
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 0,
      weekDay: 0,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 0,
      weekDay: 1,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 0,
      weekDay: 2,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 0,
      weekDay: 3,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 0,
      weekDay: 4,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 0,
      weekDay: 5,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 0,
      weekDay: 6,
    ),
    Schedule(
      lessonIds: [null, null, 0, 1, null, null, null, null],
      part: 1,
      weekDay: 0,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 1,
      weekDay: 1,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 1,
      weekDay: 2,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 1,
      weekDay: 3,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 1,
      weekDay: 4,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 1,
      weekDay: 5,
    ),
    Schedule(
      lessonIds: [null, null, null, null, null, null, null, null],
      part: 1,
      weekDay: 6,
    ),
  ]
);

const initialLessons = LessonList([]);