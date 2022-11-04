import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        height: AppConfig.appBarHeight,
        title: "Profile",
      ),
      body: const Center(child: Text("Profile tab")),
      backgroundColor: AppColors.bgDark.primary,
    );
  }
}