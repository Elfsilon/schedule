import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/schedule/models/lesson_list.dart';
import 'package:schedule/schedule/models/schedule_unit_data.dart';
import 'package:schedule/schedule/models/whole_schedule.dart';
import 'package:schedule/schedule/presentation/widgets/schedule_unit.dart';
import 'package:schedule/schedule/presentation/widgets/week_day.dart';
import 'package:schedule/schedule/store/actions/schedule_actions.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_state.dart';
import 'package:schedule/shared/utils/index.dart';
import 'package:schedule/shared/widgets/custom_appbar.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({
    super.key,
  });

  void onWeekDayTap(BuildContext context, int weekday) {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(ChangeSelectedWeekDayAction(weekday));
  }
  
  void onScheduleUnitTap(BuildContext context, int unitIndex, int? lessonId) {
    showAttachLessonDialog(
      context, 
      initialValue: lessonId,
      onAction: (value) {
        final store = StoreProvider.of<AppState>(context);   
        store.dispatch(ChangeScheduleLessonAction(
          lessonNumber: unitIndex,
          lessonId: value,
          part: store.state.schedule.selectedPart,
          weekday: store.state.schedule.selectedWeekDay,
        ));
      }
    );
  }

  Lesson? getLesson(BuildContext context, int lessonId) {
    final lessons = StoreProvider.of<AppState>(context).state.lessons;
    return lessons.getItem(lessonId);
  }

  void switchSchedulePart(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    final cuurentPartIsNumerator = store.state.schedule.selectedPart == 0;
    store.dispatch(
      ChangeSelectedPartAction(cuurentPartIsNumerator ? 1 : 0)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark.primary,
      appBar: CustomAppBar(
        height: AppConfig.appBarHeight,
        title: "Schedule",
        child: TextButton(
          onPressed: () => switchSchedulePart(context), 
          child: StoreConnector<AppState, bool>(
            converter: (store) => store.state.schedule.selectedPart == 0,
            builder: (context, cuurentPartIsNumerator) 
              => Text(cuurentPartIsNumerator ? "Numerator" : "Denominator"), 
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConfig.s12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppConfig.s12),
              child: StoreConnector<AppState, WholeSchedule>(
                converter: (store) => store.state.schedule,
                builder: (context, schedule) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WeekDay(
                        index: 0,
                        name: "Mon", 
                        selected: schedule.selectedWeekDay == 0, 
                        onPressed: () => onWeekDayTap(context, 0),
                      ),
                      WeekDay(
                        index: 1,
                        name: "Tue", 
                        selected: schedule.selectedWeekDay == 1, 
                        onPressed: () => onWeekDayTap(context, 1),
                      ),
                      WeekDay(
                        index: 2,
                        name: "Wed", 
                        selected: schedule.selectedWeekDay == 2, 
                        onPressed: () => onWeekDayTap(context, 2),
                      ),
                      WeekDay(
                        index: 3,
                        name: "Thu", 
                        selected: schedule.selectedWeekDay == 3, 
                        onPressed: () => onWeekDayTap(context, 3),
                      ),
                      WeekDay(
                        index: 4,
                        name: "Fri", 
                        selected: schedule.selectedWeekDay == 4, 
                        onPressed: () => onWeekDayTap(context, 4),
                      ),
                      WeekDay(
                        index: 5,
                        name: "Sat", 
                        selected: schedule.selectedWeekDay == 5, 
                        onPressed: () => onWeekDayTap(context, 5),
                      ),
                      WeekDay(
                        index: 6,
                        name: "Sun", 
                        selected: schedule.selectedWeekDay == 6, 
                        onPressed: () => onWeekDayTap(context, 6),
                      ),
                    ],
                  );
                }, 
              ),
            ),
            StoreConnector<AppState, WholeSchedule>(
              converter: (store) => store.state.schedule,
              builder: (context, schedule) {
                final currentSchedule = schedule.getWeekDaySchedule();
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: AppConfig.s20),
                    separatorBuilder: (context, index) => const SizedBox(height: AppConfig.s20),
                    itemBuilder: (context, index) => ScheduleUnit(
                      index: index,
                      onTap: onScheduleUnitTap,
                      lesson: currentSchedule.lessonIds[index] != null 
                        ? getLesson(context, currentSchedule.lessonIds[index]!)
                        : null, 
                      data: ScheduleUnitData.fromData(
                        lessonNumber: index, 
                        lessonsStartsAt: schedule.lessonsStartsAt, 
                        lessonDuration: schedule.lessonDuration,
                        lastBreakTime: schedule.getBreakTime(index - 1),
                        currentBreakTime: schedule.getBreakTime(index),
                      ),
                      // lesson: null,
                    ),
                    itemCount: schedule.maxLessonsPerDay,
                  ),
                );
              },
            )
          ],
        ),
      ), 
    );
  }
}