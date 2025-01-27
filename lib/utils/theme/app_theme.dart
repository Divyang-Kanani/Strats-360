import 'package:flutter/material.dart';

class AppTheme {
  static final AppTheme _appInternalTheme = AppTheme._internalTheme();

  factory AppTheme() => _appInternalTheme;

  AppTheme._internalTheme();

  ThemeData appThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.blue,
    ),
    useMaterial3: true,
  );
}
