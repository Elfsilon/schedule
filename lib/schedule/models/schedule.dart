class Schedule {
  const Schedule({
    required this.lessonIds,
    required this.weekDay,
    required this.part,
  });

  final int weekDay;
  final int part;
  /// List of ids of attached lessons to schedule, where given `null` means
  /// lesson isn't set, given `int` means id of the lesson, `index` is the 
  /// lesson number in the schedule
  /// 
  /// For example `[null, 3, 5, 2, null, null, null, null]` - means that
  /// third lesson is `Lesson` with id = 3, fourth lesson is `Lesson` with id = 5,
  /// third fifth is `Lesson` with id = 2, and rest of lessons isn't set
  final List<int?> lessonIds;

  factory Schedule.fromMap(Map<String, dynamic> map) => Schedule(
    part: map["part"] as int,
    weekDay: map["weekday"] as int,
    lessonIds: (map["lessonIds"] as List).cast<int?>(),
  );

  Map<String, dynamic> toMap() => {
    "part": part,
    "weekday": weekDay,
    "lessonIds": lessonIds,
  };
}

extension ScheduleUtils on Schedule {
  Schedule changeLesson(int lessonIndex, int? id) {
    List<int?> updatedLessonIds = [...lessonIds];
    updatedLessonIds[lessonIndex] = id;

    return Schedule(
      lessonIds: updatedLessonIds,
      part: part,
      weekDay: weekDay,
    );
  }
}