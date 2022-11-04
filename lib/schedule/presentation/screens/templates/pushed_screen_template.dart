import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/widgets/custom_appbar.dart';

class PushedScreenTemplate extends StatelessWidget {
  const PushedScreenTemplate({
    super.key,
    required this.title,
    required this.items,
    this.action,
  });

  final String title;
  final List<Widget> items;
  final Widget? action;

  void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark.primary,
      appBar: CustomAppBar(
        height: AppConfig.appBarHeight, 
        title: title,
        child: GestureDetector(
          onTap: () => close(context),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(AppConfig.s12, AppConfig.s12, 0, AppConfig.s12),
            child: Icon(
              Icons.close, 
              size: AppConfig.s32, 
              color: AppColors.fgMid.primary
            ),
          ),
        ) 
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) => AppConfig.divider,
              itemBuilder: (context, index) => items[index],
            ),
          ),
          if (action != null) SizedBox(
            width: double.infinity,
            child: action,
          ),
        ],
      ),
    );
  }
}