import 'package:flutter/material.dart';
import 'package:propagou/app/core/constants/color_constants.dart';

class AppUiConfig {
  AppUiConfig._();

  static String get title => 'Propagou';

  static const MaterialColor _swatch = MaterialColor(
    0xff75339b,
    {
      050: Color(0xff4b0075),
      100: Color(0xFF641a8f),
      200: Color(0xFF3a005b),
      300: Color(0xFF420068),
      400: Color(0xFF32004e),
      500: Color(0xFF2a0041),
      600: Color(0xFF75339b),
      700: Color(0xFF874da8),
      800: Color(0xFF9866b4),
      900: Color(0xFFa980c1),
    },
  );

  static var theme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Lexend',
    primarySwatch: _swatch,
    primaryColor: ColorConstants.primary,
    primaryColorLight: ColorConstants.primary.withOpacity(0.5),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    ),
  );
}
