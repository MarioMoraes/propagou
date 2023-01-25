import 'package:flutter/material.dart';
import 'package:propagou/app/core/styles/colors_app.dart';

class BoxTitle extends StatelessWidget {
  final String title;
  final String subTitle;

  const BoxTitle({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // Titulo
        Container(
      height: 60,
      decoration: BoxDecoration(
        color: context.colors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: context.colors.primary,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              subTitle,
              style: TextStyle(
                  fontSize: 12,
                  color: context.colors.primary.withOpacity(0.7),
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
