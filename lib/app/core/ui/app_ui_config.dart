import 'package:flutter/material.dart';
import 'package:propagou/app/core/styles/colors_app.dart';

class AppUiConfig {
  AppUiConfig._();

  static String get title => 'Propagou';

  static const MaterialColor _swatch = MaterialColor(0xffFFD600, {
    50: Color(0xffffd600),
    100: Color(0xFFe6c100),
    200: Color(0xFFccab00),
    300: Color(0xFFb39600),
    400: Color(0xFF998000),
    500: Color(0xFF806b00),
    600: Color(0xFF665600),
    700: Color(0xFFffd600),
    800: Color(0xFFffde33),
    900: Color(0xFFffe666),
  });

  static var theme = ThemeData(
    fontFamily: 'Lexend',
    primarySwatch: _swatch,
    primaryColor: ColorsApp.instance.primary,
    primaryColorLight: ColorsApp.instance.primary.withOpacity(0.5),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
}
