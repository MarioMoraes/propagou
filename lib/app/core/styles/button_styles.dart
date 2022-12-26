import 'package:flutter/material.dart';

import 'colors_app.dart';
import 'text_styles.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();

  static ButtonStyles get instance {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.instance.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        textStyle: TextStyles.instance.textPrimaryExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.instance.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        textStyle: TextStyles.instance.textPrimaryExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get yellowOutlinedButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyles.instance.textPrimaryExtraBold.copyWith(
          fontSize: 14,
        ),
        side: BorderSide(color: ColorsApp.instance.yellow),
      );

  ButtonStyle get primaryOutlinedButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyles.instance.textPrimaryExtraBold.copyWith(
          fontSize: 14,
        ),
        side: BorderSide(color: ColorsApp.instance.primary),
      );
}

extension ButtonStyleExtension on BuildContext {
  ButtonStyles get stylesButton => ButtonStyles.instance;
}
