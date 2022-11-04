import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_color.dart';

class LessonLabel extends StatelessWidget {
  const LessonLabel({
    Key? key,
    this.title,
    this.icon,
    this.color,
  }) : super(key: key);

  final String? title;
  final IconData? icon;
  final AppColor? color;

  Color _pickFgColor() {
    if (color != null) return color!.primary;
    return AppColors.fgMid.primary;
  }

  Widget content(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) Padding(
          padding: const EdgeInsets.only(right: AppConfig.s2),
          child: Icon(icon, size: AppConfig.s12, color: _pickFgColor()),
        ),          
        if (title != null) Text(
          title as String, 
          style: Theme.of(context).textTheme.bodySmall!
            .apply(color: _pickFgColor()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return color != null 
      ? Container(
        padding: const EdgeInsets.symmetric(horizontal: AppConfig.s4, vertical: AppConfig.s4),
        decoration: color != null ? BoxDecoration(
          color: color!.muted,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ) : null,
        child: content(context),
      ) : content(context);
  }
}
