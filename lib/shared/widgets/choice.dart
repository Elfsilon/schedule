import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  const Choice({
    super.key,
    required this.condition,
    required this.childIf,
    required this.childElse,
  });

  final bool condition;
  final Widget childIf;
  final Widget childElse;

  @override
  Widget build(BuildContext context) {
    return condition ? childIf : childElse;
  }
}