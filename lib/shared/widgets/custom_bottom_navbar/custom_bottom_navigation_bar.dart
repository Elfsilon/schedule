import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/utils/create_box_shadow.dart';
import 'package:schedule/shared/widgets/custom_bottom_navbar/custom_bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onSelect,
  });

  final Function(int index) onSelect;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 1;

  void onSelect(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onSelect(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.bgDark.primary,
        boxShadow: createBoxShadow(AppColors.bgDark),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomBottomNavigationBarItem(
            index: 0,
            title: "Classes",
            icon: Icons.category_rounded,
            selected: selectedIndex == 0,
            onSelect: onSelect,
          ),
          CustomBottomNavigationBarItem(
            index: 1,
            title: "Schedule",
            icon: Icons.schedule_rounded,
            selected: selectedIndex == 1,
            onSelect: onSelect,
          ),
          CustomBottomNavigationBarItem(
            index: 2,
            title: "Settings",
            icon: Icons.settings_rounded,
            selected: selectedIndex == 2,
            disabled: true,
            onSelect: onSelect,
          ),
          CustomBottomNavigationBarItem(
            index: 3,
            title: "Account",
            icon: Icons.person_rounded,
            selected: selectedIndex == 3,
            disabled: true,
            onSelect: onSelect,
          ),
        ],
      ),
    );
  }
}