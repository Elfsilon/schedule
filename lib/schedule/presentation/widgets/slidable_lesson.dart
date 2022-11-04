import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/schedule/presentation/widgets/lesson_widget.dart';
import 'package:schedule/schedule/presentation/widgets/slidable_lesson_action.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/widgets/action_wrapper.dart';

class SlidableLesson extends StatelessWidget {
  const SlidableLesson({
    super.key,
    required this.index,
    required this.data,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  final int index;
  final Lesson data;
  final Function(BuildContext context, int id) onTap;
  final Function(BuildContext context, int id) onEdit;
  final Function(BuildContext context, int id) onDelete;

  void onEditTapped(BuildContext context) {
    Slidable.of(context)?.close(); 
    onEdit(context, data.id);
  }

  void onDeleteTapped(BuildContext context) {
    Slidable.of(context)?.close(); 
    onDelete(context, data.id);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      groupTag: data.id,
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: AppConfig.s20),
          SlidableLessonAction(
            icon: Icons.edit_rounded,
            color: AppColors.azure, 
            onTap: (context) =>  onEditTapped(context),
          ),
          const SizedBox(width: AppConfig.s20),
          SlidableLessonAction(
            icon: Icons.delete_rounded,
            color: AppColors.crimsone, 
            onTap: (context) => onDeleteTapped(context),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ActionWrapper(
          onPressed: () => onTap(context, data.id), 
          child: LessonWidget(
            data: data,
          )
        ),
      ),
    );
  }
}