import 'package:flutter/material.dart';
import 'package:propagou/app/core/styles/text_styles.dart';

import '../../../core/styles/button_styles.dart';
import '../../../core/widgets/button.dart';

class HomeFilter extends StatelessWidget {
  const HomeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 5,
      children: [
        Button(
          onPressed: () {},
          width: MediaQuery.of(context).size.width * .95,
          height: 100,
          label: 'Cadastre-se',
          style: ButtonStyles.instance.secondaryButton,
          labelStyle: context.textStyles.textPrimaryFontRegular,
        ),
      ],
    );
  }
}
