import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData get generalTheme {
    return ThemeData(
      primaryColor: AppColors.darkBlue,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          color: AppColors.darkBlue,
        ),
      ),
    );
  }
}
