import 'package:flutter/material.dart';
import 'package:prove_metro_app_main/core/constants/color_constant.dart';
import 'package:prove_metro_app_main/core/constants/font_constant.dart';
import 'package:prove_metro_app_main/core/themes/app_styles.dart';

class AppTheme {

  static ColorScheme colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF13B9FF),
    primary: Color.fromARGB(255, 26, 27, 29),
    secondary: ColorConstant.whiteFF,
    surface: Color.fromARGB(255, 26, 27, 29),
    surfaceContainer: Color.fromARGB(255, 26, 27, 29),

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
        backgroundColor: ColorConstant.black3D,
        selectedItemColor: colorScheme.primary,
        selectedLabelStyle: AppStyle.txtPoppinsMedium14White.copyWith(color: Colors.white)
        
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.surface,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
