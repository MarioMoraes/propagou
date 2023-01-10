import 'package:flutter/material.dart';
import 'package:propagou/app/core/styles/colors_app.dart';

class CardTipos extends StatelessWidget {
  final String descricao;
  final String icon;

  const CardTipos({Key? key, required this.descricao, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/$icon', fit: BoxFit.cover, height: 50),
          const SizedBox(
            height: 15,
          ),
          Text(
            descricao,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: context.colors.primary),
          ),
        ],
      ),
    );
  }
}
