import 'package:schedule/shared/utils/schedule_utils.dart';

class ScheduleUnitData {
  const ScheduleUnitData({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.breakTime,
  });

  final String title;
  final String startTime;
  final String endTime;
  final String breakTime;

  factory ScheduleUnitData.fromData({
    required int lessonsStartsAt, 
    required int lastBreakTime,
    required int lessonNumber,
    required int lessonDuration,
    int? currentBreakTime,
  }) {
    final int startTimeMinutes;
    if (lessonNumber == 0) {
      startTimeMinutes = lessonsStartsAt;
    } else {
      startTimeMinutes = lessonsStartsAt + lessonNumber * (lessonDuration + lastBreakTime);
    }
    final endTimeMinutes = startTimeMinutes + lessonDuration;
    final breakTime = currentBreakTime ?? lastBreakTime;

    return ScheduleUnitData(
      title: "${lessonNumber + 1} class",
      startTime: formatTime(startTimeMinutes), 
      endTime: formatTime(endTimeMinutes), 
      breakTime: "($breakTime min break)",
    );
  }
}
