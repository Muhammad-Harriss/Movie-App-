import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headlineMedium!.copyWith(
        fontSize: Sizes.dimen_40.sp,
        color: Colors.white,
      );

  static TextStyle get _whiteHeadline5 => _poppinsTextTheme.headlineSmall!.copyWith(
        fontSize: Sizes.dimen_40.sp,
        color: Colors.white,
      );

  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.titleMedium!.copyWith(
        fontSize: Sizes.dimen_18.sp,
        color: Colors.white,
      );

  static TextStyle get _whitebutton => _poppinsTextTheme.labelLarge!.copyWith(
        fontSize: Sizes.dimen_14.sp,
        color: Colors.white,
      );

  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyMedium!.copyWith(
        fontSize: Sizes.dimen_16.sp,
        color: Colors.white,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextTheme getTextTheme() => TextTheme(
        headlineMedium: _whiteHeadline6,
        headlineSmall: _whiteHeadline5,
        titleMedium: whiteSubtitle1,
        bodyMedium: whiteBodyText2,
        labelLarge: _whitebutton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => titleMedium!.copyWith(
        color: AppColors.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle get whiteSubtitle1 => titleMedium!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );
}
