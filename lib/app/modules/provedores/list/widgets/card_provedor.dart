import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:propagou/app/core/constants/color_constants.dart';
import 'package:propagou/app/core/styles/text_styles.dart';

import '../../../../models/provedor_model.dart';

class CardProvedor extends StatelessWidget {
  final ProvedorModel provedorModel;

  const CardProvedor({super.key, required this.provedorModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.primary.withOpacity(0.2),
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: ListTile(
            focusColor: ColorConstants.primary,
            splashColor: ColorConstants.secondary,
            horizontalTitleGap: 40,
            leading: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.cover,
              height: 20,
              width: 20,
            ).animate().scaleXY(
                begin: 0,
                end: 2.5,
                duration: 500.ms,
                curve: Curves.easeInOutSine),
            title: Text(
              provedorModel.nome,
              style: context.textStyles.textPrimaryFontMedium
                  .copyWith(fontSize: 15),
            ),
            subtitle: Text(
              provedorModel.endereco,
              style: context.textStyles.textPrimaryFontMedium
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w200),
            ),
          ),
        ),
      ),
    );
  }
}
