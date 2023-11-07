import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:propagou/app/core/constants/color_constants.dart';
import 'package:propagou/app/core/styles/text_styles.dart';

import '../../../../models/provedor_model.dart';

class CardProvedor extends StatelessWidget {
  final ProvedorModel provedorModel;

  const CardProvedor({super.key, required this.provedorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      height: 80,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: ColorConstants.primary.withOpacity(0.2),
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              Text(
                provedorModel.nome,
                style: context.textStyles.textPrimaryFontMedium
                    .copyWith(fontSize: 15),
              ),
              Text(
                provedorModel.endereco,
                style: context.textStyles.textPrimaryFontMedium
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w200),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Info',
                    style: context.textStyles.textPrimaryFontRegular
                        .copyWith(fontSize: 12),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
