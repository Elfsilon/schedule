import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_color.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    super.key,
    required this.index,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onSelect,
    this.disabled = false,
  });

  final int index;
  final String title;
  final IconData icon;
  final bool selected;
  final bool disabled;
  final Function(int index) onSelect;

  final _animationDuration = const Duration(milliseconds: 300);

  AppColor getInitColor() {
    if (disabled) return AppColors.fgDark;
    if (selected) return AppColors.merigold;
    return AppColors.fgMid;
  }

  void onTap() {
    if (!disabled && !selected) {
      onSelect(index);
    }
  } 

  @override
  Widget build(BuildContext context) {
    final color = getInitColor();

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppConfig.s8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: _animationDuration,
              curve: Curves.ease,
              padding: const EdgeInsets.all(AppConfig.s8),
              decoration: BoxDecoration(
                color: selected ? color.muted : Colors.transparent,
                borderRadius: BorderRadius.circular(AppConfig.s8),
              ),
              child: Icon(
                icon, 
                size: AppConfig.s32, 
                // color: color.primary
                color: color.primary,
              ),
            ),
            const SizedBox(height: AppConfig.s4),
            AnimatedDefaultTextStyle(
              duration: _animationDuration,
              style: TextStyle(
                fontSize: AppConfig.s12,
                color: color.primary,
              ),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}