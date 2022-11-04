class ChangeScheduleLessonAction {
  const ChangeScheduleLessonAction({
    required this.part,
    required this.weekday,
    required this.lessonNumber,
    required this.lessonId,
  });

  final int part;
  final int weekday;
  final int? lessonId;
  final int lessonNumber;
}

class ChangeSelectedWeekDayAction {
  const ChangeSelectedWeekDayAction(this.weekDay);

  final int weekDay;
}

class ChangeSelectedPartAction {
  const ChangeSelectedPartAction(this.part);

  final int part;
}