import 'package:flutter/material.dart';

import 'package:prove_metro_app_main/core/constants/color_constant.dart';
import 'package:prove_metro_app_main/core/constants/font_constant.dart';
import 'package:prove_metro_app_main/core/themes/app_styles.dart';

class AppTheme {

  static ColorScheme colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF13B9FF),
    primary: ColorConstant.black1D,
    secondary: ColorConstant.whiteFF,
    surface: ColorConstant.black1D,
    onSurfaceVariant: ColorConstant.black3D,
    surfaceContainer: ColorConstant.black1D,
  );

  static ThemeData get dark {
    return ThemeData(
      colorScheme: colorScheme,

      fontFamily: AppFonts.appFontPoppins,

      appBarTheme: AppBarTheme(
        color: colorScheme.surface,
      ),

      scaffoldBackgroundColor: colorScheme.surface,

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.onSurfaceVariant,
        selectedItemColor: colorScheme.secondary,
        unselectedItemColor: colorScheme.primary,
        selectedLabelStyle: AppStyle.txtPoppinsRegular12White,
        unselectedLabelStyle: AppStyle.txtPoppinsRegular12White,
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.surface,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
