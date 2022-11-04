import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';

class EditDialog extends StatelessWidget {
  const EditDialog({
    super.key,
    required this.label,
    required this.onAction,
    required this.onClose,
    required this.child,
    this.description,
  });

  final String label;
  final String? description;
  final Widget child;
  final Function()? onClose;
  final Function()? onAction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.bgMid.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Label part
            Text(label, style: Theme.of(context).textTheme.titleSmall),

            // Description part
            if (description != null) const SizedBox(height: 4),
            if (description != null) Text(description!, style: Theme.of(context).textTheme.bodySmall),
            if (description != null) const SizedBox(height: 12),

            // Child part
            child,
            const SizedBox(height: 8),

            // Buttons part
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAction,
                    child: const Text("Apply"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextButton(
                    onPressed: onClose,
                    child: const Text("Close"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
