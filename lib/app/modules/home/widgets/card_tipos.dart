import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';
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
    return InkWell(
      onTap: () {
        homeController.changeItem(id);
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              descricao,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: ColorConstants.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
