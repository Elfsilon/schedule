import 'dart:convert';

import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/schedule/models/lesson_list.dart';
import 'package:schedule/schedule/models/whole_schedule.dart';

class AppState {
  const AppState({
    required this.lessons,
    required this.currentLesson,
    required this.schedule,
  });

  // Lessons screen
  final LessonList lessons;
  final Lesson? currentLesson;

  // Schedule screen
  final WholeSchedule schedule;

  factory AppState.fromMap(Map<String, dynamic> map) => AppState(
    currentLesson: null,
    lessons: LessonList.fromMap(map["lessons"]),
    schedule: WholeSchedule.fromMap(map["schedule"]),
  );

  Map<String, dynamic> toMap() => {
    "lessons": lessons.items.map((e) => e.toMap()).toList(),
    "schedule": schedule.toMap(),
  };
}