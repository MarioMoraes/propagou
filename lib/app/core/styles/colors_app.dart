import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xffFFD600);
  Color get secondary => const Color(0xff920AB4);
  Color get yellow => const Color(0xfffdc350);
  Color get grey => const Color(0xffcccccc);
  Color get greyDark => const Color(0xff999999);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
