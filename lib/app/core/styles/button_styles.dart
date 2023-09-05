import 'package:flutter/material.dart';
import 'package:propagou/app/core/constants/color_constants.dart';

import 'text_styles.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();

  static ButtonStyles get instance {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get secondaryButton => ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        textStyle: TextStyles.instance.textPrimaryExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: ColorConstants.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        textStyle: TextStyles.instance.textPrimaryExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get secondaryOutlinedButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyles.instance.textPrimaryExtraBold.copyWith(
          fontSize: 14,
        ),
        side: const BorderSide(color: ColorConstants.secondary),
      );

  ButtonStyle get primaryOutlinedButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyles.instance.textPrimaryExtraBold.copyWith(
          fontSize: 14,
        ),
        side: const BorderSide(color: ColorConstants.primary),
      );
}

extension ButtonStyleExtension on BuildContext {
  ButtonStyles get stylesButton => ButtonStyles.instance;
}
