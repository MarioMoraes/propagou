import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:propagou/app/core/constants/color_constants.dart';

import '../controller/home_state.dart';

class CardTipos extends StatelessWidget {
  final String id;
  final String descricao;
  final String icon;
  final bool selected;
  final HomeController homeController;

  const CardTipos({
    Key? key,
    required this.descricao,
    required this.icon,
    required this.id,
    required this.homeController,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeController.changeItem(id);
      },
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          color: selected
              ? ColorConstants.background.withOpacity(0.5)
              : Colors.white,
          border: Border.all(color: ColorConstants.primary.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$icon',
              fit: BoxFit.cover,
              height: 35,
              width: 35,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              descricao,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: ColorConstants.greyDark,
              ),
            ),
          ],
        ),
      )
          .animate()
          .scaleXY(
            begin: 0.0,
            end: 1.0,
            duration: 500.ms,
            curve: Curves.decelerate,
          )
          .fadeIn()
          .blurXY(begin: 10, end: 0),
    );
  }
}
