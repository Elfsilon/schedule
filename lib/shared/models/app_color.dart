import 'package:flutter/material.dart';

class AppColor {
  const AppColor(
    this.name,
    this.primary,
    [
      this.muted = const Color(0x18000000),
      this.shadow = const Color(0x33000000),
    ]
  );

  final String name;
  final Color primary;
  final Color shadow;
  final Color muted;
}