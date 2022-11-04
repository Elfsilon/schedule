import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:schedule/schedule/presentation/screens/lessons_screen.dart';
import 'package:schedule/schedule/presentation/screens/profile_screen.dart';
import 'package:schedule/schedule/presentation/screens/schedule_screen.dart';
import 'package:schedule/schedule/presentation/screens/settings_screen.dart';
import 'package:schedule/shared/models/app_state.dart';
import 'package:schedule/shared/widgets/custom_bottom_navbar/custom_bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTabs extends StatefulWidget {
  const AppTabs({
    super.key,
  });

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> {
  Widget _selectedTab = const ScheduleScreen();

  final _tabScreens = const [
    LessonsScreen(),
    ScheduleScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  void onTabSelected(int index) {
    setState(() {
      _selectedTab = _tabScreens[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedTab,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onSelect: onTabSelected,
      ),
    );
  }
}