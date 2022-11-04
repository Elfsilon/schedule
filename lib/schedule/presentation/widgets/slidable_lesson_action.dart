import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_color.dart';

class SlidableLessonAction extends StatelessWidget {
  const SlidableLessonAction({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final AppColor color;
  final Function(BuildContext context) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(AppConfig.s8),
        decoration: BoxDecoration(
          color: color.primary,
          borderRadius: AppConfig.borderRadius50,
          boxShadow: [BoxShadow(
            blurRadius: AppColors.shadowBlurRange,
            spreadRadius: AppColors.shadowSpreadRange,
            color: color.shadow,
          )],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon, 
                size: AppConfig.s24, 
                color: AppColors.fgLight.primary
              ),
            ],
          ),
        ),
      ),
    );
  }
}