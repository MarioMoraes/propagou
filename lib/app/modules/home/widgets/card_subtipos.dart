import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:propagou/app/core/constants/color_constants.dart';

class CardSubTipos extends StatelessWidget {
  final String id;
  final String descricao;
  final String icon;

  const CardSubTipos({
    Key? key,
    required this.descricao,
    required this.icon,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed('/subtipos',
          arguments: {'id': id, 'descricao': descricao, 'icon': icon}),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(2),
        height: 40,
        decoration: BoxDecoration(
          color: ColorConstants.background.withOpacity(0.9),
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          descricao,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Colors.black,
            overflow: TextOverflow.clip,
          ),
        ),
      )
          .animate()
          .scaleXY(
            begin: 0.0,
            end: 1.0,
            duration: 500.ms,
            curve: Curves.decelerate,
          )
          .fadeIn(),
    );
  }
}
