import 'package:flutter/material.dart';
import 'package:pharmacy_management/style/colors/colors_dark.dart';
import 'package:pharmacy_management/style/colors/colors_light.dart';
// import 'package:pharmacy_management/style/fonts/font_family_helper.dart';
import 'package:pharmacy_management/style/themes/color_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark],
    useMaterial3: true,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.white,
        // fontFamily: FontFamilyHelper.geLocalizedFontFamily(),
      ),
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.light],
    useMaterial3: true,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.black1,
        // fontFamily: FontFamilyHelper.geLocalizedFontFamily(),
      ),
    ),
  );
}
