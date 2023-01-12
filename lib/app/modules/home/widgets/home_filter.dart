import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
        /*
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/banner.webp'),
            ),
          ),
        ),
        */

        Button(
          onPressed: () {
            Modular.to.pushNamed('/provedor');
          },
          width: MediaQuery.of(context).size.width * .95,
          height: 50,
          label: 'Cadastre-se',
          style: ButtonStyles.instance.primaryOutlinedButton,
          labelStyle: context.textStyles.textPrimaryFontRegular,
        ),
      ],
    );
  }
}
