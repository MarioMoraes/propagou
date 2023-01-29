import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/banner2.png',
              fit: BoxFit.cover,
              height: 90,
              width: 90,
            ),
            /*
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
            */
          ],
        ),
      ),
    );
  }
}
