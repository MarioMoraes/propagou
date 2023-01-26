import 'package:flutter/material.dart';
import 'package:propagou/app/core/styles/colors_app.dart';
import 'package:propagou/app/core/styles/text_styles.dart';

class CustomShow extends StatelessWidget {
  final String ec;

  const CustomShow({
    super.key,
    required this.ec,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: context.colors.background.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                ec,
                style: context.textStyles.textPrimaryFontMedium
                    .copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
