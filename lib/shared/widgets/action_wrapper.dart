import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';

class ActionWrapper extends StatelessWidget {
  const ActionWrapper({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.all(AppColors.bgLight.primary),
        backgroundColor: MaterialStateProperty.all(AppColors.bgDark.muted),
      ),
      child: child,
    );
  }
}