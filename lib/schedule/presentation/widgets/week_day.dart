import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';

class WeekDay extends StatelessWidget {
  const WeekDay({
    super.key,
    required this.index,
    required this.name,
    required this.selected,
    required this.onPressed,
  });

  final int index;
  final String name;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final today = index == DateTime.now().weekday - 1;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 40,
        decoration: BoxDecoration(
          color: selected ? AppColors.merigold.primary : AppColors.bgMid.primary,
          borderRadius: AppConfig.borderRadius12,
        ),
        child: Center(
          child: Text(
            name, 
            style: TextStyle(
              color: selected ? AppColors.fgLight.primary
                : today ? AppColors.merigold.primary: AppColors.fgMid.primary,
            ),
          ),
        ),
      ),
    );
  }
}