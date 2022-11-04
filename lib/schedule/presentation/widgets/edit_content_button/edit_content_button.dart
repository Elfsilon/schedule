import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';

class EditContentButton extends StatelessWidget {
  const EditContentButton({
    super.key,
    required this.title,
    required this.content,
    required this.onPressed,
    this.nullable = true,
    this.child,
  });

  final String title;
  final bool nullable;
  final String? content;
  final Widget? child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        overlayColor: MaterialStateProperty.all(AppColors.fgDark.primary),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        )),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConfig.s16, vertical: AppConfig.s8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(Icons.edit_rounded, color: AppColors.fgMid.primary),
            const SizedBox(width: AppConfig.s12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: title, style: Theme.of(context).textTheme.bodySmall),
                        if (!nullable) TextSpan(
                          text: " *", 
                          style: Theme.of(context).textTheme.bodySmall!
                            .apply(color: AppColors.roseRed.primary)
                        ),
                      ]
                    )
                  ),
                  const SizedBox(height: AppConfig.s4),
                  content != null && content!.isNotEmpty 
                  ? Text(content!, style: Theme.of(context).textTheme.bodyLarge)
                  : Text("Not set", style: 
                      Theme.of(context).textTheme.bodyLarge!.apply(color: AppColors.fgMid.primary)
                    ),
                ],
              ),
            ),
            if (child != null) child as Widget,
          ],
        ), 
      ),
    );
  }
}