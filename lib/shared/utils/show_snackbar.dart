import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';

void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: AppColors.roseRed.muted,
        content: Row(
          children: [
            Icon(
              Icons.error_outline_rounded, 
              size: 24, 
              color: AppColors.roseRed.primary
            ),
            const SizedBox(width: 4),
            Text(message, style: TextStyle(
              color: AppColors.roseRed.primary,
            )),
          ],
        ), 
      )
    );
  }