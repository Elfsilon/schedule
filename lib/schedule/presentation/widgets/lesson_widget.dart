import 'package:flutter/material.dart';
import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/schedule/presentation/widgets/lesson_icon.dart';
import 'package:schedule/schedule/presentation/widgets/lesson_label.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/extensions/string_extensions.dart';

class LessonWidget extends StatelessWidget {
  const LessonWidget({
    super.key,
    required this.data,
  });

  final Lesson data;

  bool get hasDescription => data.description != null && data.description!.isNotEmpty;
  bool get hasAuditory => data.auditory != null && data.auditory!.isNotEmpty;
  bool get hasProfessor => data.professor != null && data.professor!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConfig.s12),
      child: Row(
        children: [
          LessonIcon(color: data.color, icon: data.icon),
          const SizedBox(width: AppConfig.s12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: AppConfig.s8),
                Wrap(
                  spacing: AppConfig.s8,
                  runSpacing: AppConfig.s4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    LessonLabel(title: data.type.name.capitalize(), color: data.color),
                    if (hasProfessor) LessonLabel(title: data.professor, icon: Icons.person, color: data.color),
                    if (hasDescription) const LessonLabel(icon: Icons.description),
                    if (hasAuditory) LessonLabel(title: data.auditory),
                  ],
                ),
              ],
            ),
          ),
          if (data.pinned) const LessonLabel(icon: Icons.lock),
        ],
      ),
    );
  }
}