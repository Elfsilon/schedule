import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/utils/create_box_shadow.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.height,
    required this.title,
    this.child,
  });

  final double height;
  final String title;
  final Widget? child;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(24, 25, 24, 0),
      decoration: BoxDecoration(
        color: AppColors.bgDark.primary,
        boxShadow: createBoxShadow(AppColors.bgLight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          if (child != null) child as Widget,
        ],
      ),
    );
  }
}
