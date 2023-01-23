import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:propagou/app/core/styles/colors_app.dart';

class CardTipos extends StatelessWidget {
  final String id;
  final String descricao;
  final String icon;

  const CardTipos(
      {Key? key, required this.descricao, required this.icon, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed('/subtipos',
          arguments: {'id': id, 'descricao': descricao, 'icon': icon}),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: context.colors.primary.withOpacity(0.1),
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 6,
            ),
            Image.asset('assets/images/$icon', fit: BoxFit.cover, height: 30),
            const SizedBox(
              height: 8,
            ),
            Text(
              descricao,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: context.colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
