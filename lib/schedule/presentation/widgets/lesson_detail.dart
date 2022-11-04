import 'package:flutter/material.dart';
import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/schedule/presentation/widgets/lesson_icon.dart';
import 'package:schedule/schedule/presentation/widgets/lesson_label.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/extensions/string_extensions.dart';

class LessonDetail extends StatelessWidget {
  const LessonDetail({
    super.key,
    required this.id,
    required this.lesson,
    required this.onEdit,
    required this.onDelete,
  });

  final int id;
  final Lesson lesson;
  final Function(BuildContext, int) onEdit;
  final Function(BuildContext, int) onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgMid.primary
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConfig.s12, vertical: AppConfig.s12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LessonIcon(color: lesson.color, icon: lesson.icon),
                    const SizedBox(width: AppConfig.s12),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(lesson.title, style: Theme.of(context).textTheme.bodyLarge),
                          if (lesson.description != null) const SizedBox(height: AppConfig.s4),
                          if (lesson.description != null) Text(lesson.description!, style: Theme.of(context).textTheme.bodySmall),

                          const SizedBox(height: AppConfig.s8),
                          Wrap(
                            spacing: AppConfig.s4,
                            runSpacing: AppConfig.s4,
                            children: [
                              LessonLabel(
                                title: lesson.type.name.capitalize(),
                                color: lesson.color,
                              ),                                
                              if (lesson.professor != null) LessonLabel(
                                title: lesson.professor,
                                color: lesson.color,
                                icon: Icons.person_rounded,
                              ),
                            ],
                          ),

                          if (lesson.auditory != null) const SizedBox(height: AppConfig.s8),
                          if (lesson.auditory != null) Text("Auditory: ${lesson.auditory!}", style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          
          AppConfig.divider,
          const Divider(height: 1),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                overlayColor: MaterialStateProperty.all(AppColors.fgDark.primary),
                foregroundColor: MaterialStateProperty.all(AppColors.fgMid.primary),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )),
              ),
              onPressed: () => onEdit(context, id),
              icon: const Icon(Icons.edit_rounded, size: AppConfig.s16),
              label: const Text("Edit"),
            ),
          ),
          AppConfig.divider,
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.roseRed.muted),
                overlayColor: MaterialStateProperty.all(AppColors.crimsone.muted),
                foregroundColor: MaterialStateProperty.all(AppColors.roseRed.primary),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )),
              ),
              onPressed: () => onDelete(context, id),
              icon: const Icon(Icons.delete_rounded, size: AppConfig.s16),
              label: const Text("Delete"),
            ),
          ),
        ],
      ),
    );
  }
}