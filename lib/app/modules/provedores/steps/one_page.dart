import 'package:flutter/material.dart';
import 'package:propagou/app/core/styles/colors_app.dart';
import 'package:propagou/app/core/styles/text_styles.dart';
import 'package:propagou/app/core/widgets/custom_text_form_field.dart';

class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: context.colors.secondary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Informe seu Email',
                    style: context.textStyles.textPrimaryFontRegular.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              hint: 'Email',
              onChange: (value) {},
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_outlined),
                label: const Text('PRÓXIMO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
