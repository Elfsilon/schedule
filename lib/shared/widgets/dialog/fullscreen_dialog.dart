import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_color.dart';

class FullscreenDialog extends StatelessWidget {
  const FullscreenDialog({
    super.key,
    required this.title,
    required this.actionName,
    required this.color,
    required this.onAction,
    this.description,
  });

  final String title;
  final String? description;
  final String actionName;
  final AppColor color;
  final Function()? onAction;

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  void _handleAction(BuildContext context) {
    if (onAction != null) onAction!();
    _close(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConfig.s12),
      decoration: BoxDecoration(
        color: AppColors.bgDark.shadow,
        borderRadius: AppConfig.borderRadius12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          if (description != null) const SizedBox(height: AppConfig.s8),
          if (description != null) Text(description!, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: AppConfig.s8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (onAction != null) ElevatedButton(
                onPressed: () => _handleAction(context), 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color.primary),
                  overlayColor: MaterialStateProperty.all(AppColors.crimsone.primary),
                ),
                child: Text(actionName),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () => _close(context), 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color.muted),
                  foregroundColor: MaterialStateProperty.all(color.primary),
                  overlayColor: MaterialStateProperty.all(AppColors.crimsone.muted),
                ),
                child: const Text("Close"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}