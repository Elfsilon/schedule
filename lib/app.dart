import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schedule/app_tabs.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_state.dart';
import 'package:schedule/shared/utils/get_swatch.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.subscription,
  });

  final StreamSubscription<AppState> subscription;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(500, getSwatch(AppColors.merigold.primary)),
        brightness: Brightness.dark,
        backgroundColor: AppColors.bgMid.primary,
        fontFamily: "Nunito",

        // Text theme
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: AppColors.fgMid.primary,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: AppConfig.s16),
          prefixIconColor: AppColors.fgMid.primary,
          suffixIconColor: AppColors.fgMid.primary,
          filled: true,
          fillColor: AppColors.bgDark.primary,
          errorStyle: TextStyle(color: AppColors.roseRed.primary),
          border: const OutlineInputBorder(
            borderRadius: AppConfig.borderRadius16,
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: AppConfig.borderRadius16,
            borderSide: BorderSide(
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppConfig.borderRadius16,
            borderSide: BorderSide(
              color: AppColors.merigold.primary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppConfig.borderRadius16,
            borderSide: BorderSide(
              color: AppColors.roseRed.primary,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppConfig.borderRadius16,
            borderSide: BorderSide(
              color: AppColors.roseRed.primary,
              width: 2,
            ),
          ),
        ),

        // Button themes
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.merigold.muted),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor: MaterialStateProperty.all(AppColors.bumblebee.muted),
            foregroundColor: MaterialStateProperty.all(AppColors.merigold.primary),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: AppConfig.borderRadius16,
            )),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) return AppColors.bgLight.primary;
              return AppColors.merigold.primary;
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) return AppColors.fgMid.primary;
              return AppColors.fgLight.primary;
            }),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            overlayColor: MaterialStateProperty.all(AppColors.bumblebee.primary),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: AppConfig.borderRadius16,
            )),
          ),
        ),
      ),
      home: const AppTabs(),
      debugShowCheckedModeBanner: false,
    );
  }
}