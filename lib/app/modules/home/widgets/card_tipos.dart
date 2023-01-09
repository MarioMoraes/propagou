import 'package:flutter/material.dart';

class CardTipos extends StatelessWidget {
  final String descricao;
  final String icon;

  const CardTipos({Key? key, required this.descricao, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/$icon', fit: BoxFit.cover, height: 30),
          const SizedBox(
            height: 15,
          ),
          Text(
            descricao,
          ),
        ],
      ),
    );
  }
}
