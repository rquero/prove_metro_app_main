import 'package:flutter/material.dart';
import 'package:prove_metro_app_main/core/constants/color_constant.dart';
import 'package:prove_metro_app_main/core/constants/font_constant.dart';

class AppStyle {
  static TextStyle txtPoppinsRegular14Black = TextStyle(
    color: ColorConstant.black3D,
    fontSize: 14,
    fontFamily: AppFonts.appFontPoppins,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsMedium14White = TextStyle(
    color: ColorConstant.whiteFC,
    fontSize: 14,
    fontFamily: AppFonts.appFontPoppins,
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtPoppinsRegular14White = const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: AppFonts.appFontPoppins,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsRegular12White = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: AppFonts.appFontPoppins,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtPoppinsSemiBold18White = const TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontFamily: AppFonts.appFontPoppins,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtPoppinsSemiBold24White = const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontFamily: AppFonts.appFontPoppins,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtPoppinsSemiBold16White = TextStyle(
    color: ColorConstant.whiteFF,
    fontSize: 16,
    fontFamily: AppFonts.appFontPoppins,
    fontWeight: FontWeight.w600,
  );

}
