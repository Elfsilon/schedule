import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/widgets/custom_appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        height: AppConfig.appBarHeight,
        title: "Settings",
      ),
      body: const Center(child: Text("Settings tab")),
      backgroundColor: AppColors.bgDark.primary,
    );
  }
}