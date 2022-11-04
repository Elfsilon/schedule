import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_color.dart';

class LessonIcon extends StatelessWidget {
  const LessonIcon({
    super.key,
    required this.color,
    required this.icon,
  });

  final AppColor color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConfig.s12),
      decoration: BoxDecoration(
        color: color.muted,
        borderRadius: AppConfig.borderRadius12,
      ),
      child: Icon(
        icon, size: AppConfig.s24, 
        color: color.primary
      ),
    );
  }
}