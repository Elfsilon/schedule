import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/schedule/models/lesson_list.dart';
import 'package:schedule/schedule/models/schedule.dart';
import 'package:schedule/schedule/models/whole_schedule.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_state.dart';

const initialWholeSchedule = WholeSchedule(
  selectedPart: 0,
  selectedWeekDay: 0, 
  lessonsStartsAt: 510,
  lessonDuration: 90,
  maxLessonsPerDay: 8,
  breakTime: 10,
  userBreakTime: [null, null, 15, null, null, null, null, null],
  items: [
    Schedule(
      lessonIds: [null, 0, 1, null, null, null, null, null],
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

const initialLessons = LessonList([
  Lesson(
    id: 0, 
    title: "Consectetur adipiscing", //Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
    color: AppColors.amethyst, 
    icon: Icons.work,
    auditory: "305A",
    professor: "Austin Aggue",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
    type: LessonType.lecture,
  ),
  Lesson(
    id: 1, 
    title: "Lorem ipsum dolor sit amet", //Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
    color: AppColors.flameOrange, 
    icon: Icons.workspace_premium_rounded,
    auditory: "1280C",
    professor: "Brandon Beggin",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
    type: LessonType.lab,
  ),
]);

const appState = AppState(
  lessons: initialLessons, 
  currentLesson: null, 
  schedule: initialWholeSchedule,
);

void main() {
  test('app state ...', () {
    final map = appState.toMap();
    String json = jsonEncode(map);

    final decoded = jsonDecode(json);
    final decodedState = AppState.fromMap(decoded);

    expect(decodedState.currentLesson == appState.currentLesson, true);
    expect(decodedState.schedule.items.length == appState.schedule.items.length, true);
    expect(decodedState.schedule.userBreakTime.length == appState.schedule.userBreakTime.length, true);
    expect(decodedState.lessons.items.length == appState.lessons.items.length, true);
  });
}