import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_color.dart';

List<BoxShadow> createBoxShadow(AppColor color) {
  return [BoxShadow(
    blurRadius: AppColors.shadowBlurRange,
    spreadRadius: AppColors.shadowSpreadRange,
    color: color.shadow,
  )];
}