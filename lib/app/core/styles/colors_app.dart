import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xff75339b);
  Color get secondary => const Color(0xfffdc350);
  Color get grey => const Color(0xffcccccc);
  Color get greyDark => const Color.fromARGB(255, 101, 39, 39);
  Color get white => Colors.white;
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
