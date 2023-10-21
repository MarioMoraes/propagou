import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:propagou/app/core/constants/color_constants.dart';

import '../controller/home_state.dart';

class CardTipos extends StatelessWidget {
  final String id;
  final String descricao;
  final String icon;
  final HomeController homeController;

  const CardTipos({
    Key? key,
    required this.descricao,
    required this.icon,
    required this.id,
    required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeController.changeItem(id);
      },
      child: Container(
        height: 80,
        width: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorConstants.primary.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$icon',
              fit: BoxFit.cover,
              height: 50,
              width: 50,
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
