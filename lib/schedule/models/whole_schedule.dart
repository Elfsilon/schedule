import 'package:schedule/schedule/models/schedule.dart';

class WholeSchedule {
  const WholeSchedule({
    required this.selectedPart,
    required this.selectedWeekDay,
    required this.items,
    required this.maxLessonsPerDay,
    required this.lessonsStartsAt,
    required this.lessonDuration,
    required this.breakTime,
    required this.userBreakTime,
  });

  final int selectedPart;
  final int selectedWeekDay;

  final List<Schedule> items;

  final int lessonsStartsAt;
  final int lessonDuration;
  final int maxLessonsPerDay;
  final int breakTime;
  final List<int?> userBreakTime;

  factory WholeSchedule.fromMap(Map<String, dynamic> map) => WholeSchedule(
    selectedPart: 0,
    selectedWeekDay: DateTime.now().weekday - 1,
    items: map["schedule"].map<Schedule>((e) => Schedule.fromMap(e)).toList(),
    breakTime: map["break_time"] as int,
    lessonDuration: map["lesson_duration"] as int,
    lessonsStartsAt: map["lessons_starts_at"] as int,
    maxLessonsPerDay: map["max_lessons_per_day"] as int,
    userBreakTime: map["user_break_time"].cast<int?>(),
  );

  Map<String, dynamic> toMap() => {
    "schedule": items.map((e) => e.toMap()).toList(),
    "selected_part": selectedPart,
    "selected_weekday": selectedWeekDay,
    "break_time": breakTime,
    "lesson_duration": lessonDuration,
    "lessons_starts_at": lessonsStartsAt,
    "max_lessons_per_day": maxLessonsPerDay,
    "user_break_time": userBreakTime,
  };
}

extension WholeScheduleUtils on WholeSchedule {
  Schedule getWeekDaySchedule() {
    final unit = items.firstWhere((element) {
      return element.part == selectedPart && element.weekDay == selectedWeekDay;
    });
    return unit;
  }

  WholeSchedule changeLesson(int part, int weekday, int lessonNumber, int? id) {
    final updatedScheduleList = <Schedule>[];
    for (final schedule in items) {
      if (schedule.part == part && schedule.weekDay == weekday) {
        final updatedSchedule = schedule.changeLesson(lessonNumber, id);
        updatedScheduleList.add(updatedSchedule);
      } else {
        updatedScheduleList.add(schedule);
      }
    }
    return WholeSchedule(
      items: updatedScheduleList,
      selectedPart: selectedPart,
      selectedWeekDay: selectedWeekDay,
      breakTime: breakTime,
      lessonDuration: lessonDuration,
      lessonsStartsAt: lessonsStartsAt,
      maxLessonsPerDay: maxLessonsPerDay,
      userBreakTime: userBreakTime,
    );
  }

  WholeSchedule changeSelectedWeekDay(int weekday) {
    return WholeSchedule(
      selectedWeekDay: weekday,
      items: items,
      selectedPart: selectedPart,
      breakTime: breakTime,
      lessonDuration: lessonDuration,
      lessonsStartsAt: lessonsStartsAt,
      maxLessonsPerDay: maxLessonsPerDay,
      userBreakTime: userBreakTime,

    );
  }

  WholeSchedule changeSelectedPart(int part) {
    return WholeSchedule(
      selectedPart: part,
      items: items,
      selectedWeekDay: selectedWeekDay,
      breakTime: breakTime,
      lessonDuration: lessonDuration,
      lessonsStartsAt: lessonsStartsAt,
      maxLessonsPerDay: maxLessonsPerDay,
      userBreakTime: userBreakTime,

    );
  }

  int getBreakTime(int lessonIndex) {
    if (lessonIndex < 0) return breakTime;
    return userBreakTime[lessonIndex] ?? breakTime;
  }

}