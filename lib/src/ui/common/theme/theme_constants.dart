import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      background: AppColor.whiteColor,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade200,
      inversePrimary: Color(0XFF342F3F),
      tertiary: AppColor.darkGrey,
      onPrimary: AppColor.blackColor
    ),
  );

  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      background: Color(0XFF1D182A),
      primary: Colors.grey.shade600,
      secondary: Colors.grey.shade800,
      inversePrimary: Color(0XFF342F3F),
        tertiary: Color(0XFF342F3F),
      onPrimary: AppColor.whiteColor

    ),
  );
}
