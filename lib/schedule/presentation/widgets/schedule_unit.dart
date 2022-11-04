import 'package:flutter/material.dart';
import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/schedule/models/schedule_unit_data.dart';
import 'package:schedule/schedule/presentation/widgets/lesson_widget.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/widgets/action_wrapper.dart';

class ScheduleUnit extends StatelessWidget {
  const ScheduleUnit({
    super.key,
    required this.index,
    required this.data,
    required this.onTap,
    this.lesson,
  });

  final int index;
  final ScheduleUnitData data;
  final Lesson? lesson;
  final Function(BuildContext, int, int?) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConfig.s16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data.title, style: Theme.of(context).textTheme.bodySmall),
              Text("${data.startTime} - ${data.endTime} ${data.breakTime}", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
        const SizedBox(height: AppConfig.s4),
        ActionWrapper(
          onPressed: () => onTap(context, index, lesson?.id), 
          child: lesson == null
            ? Container(
                height: 70, 
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.bgDark.muted,
                ),
                child: Center(
                  child: Icon(
                    Icons.add_rounded, 
                    size: AppConfig.s16, 
                    color: AppColors.fgMid.primary
                  ),
                ),
              )
            : LessonWidget(data: lesson!),
        ),
      ],
    );
  }
}