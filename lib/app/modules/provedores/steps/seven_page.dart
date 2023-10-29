import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../core/widgets/box_title.dart';
import '../../../models/register_model.dart';

class SevenPage extends StatefulWidget {
  const SevenPage({super.key});

  @override
  State<SevenPage> createState() => _SevenPageState();
}

class _SevenPageState extends State<SevenPage> {
  late RegisterModel registerModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      registerModel =
          ModalRoute.of(context)?.settings.arguments as RegisterModel;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  const BoxTitle(
                    title: 'Autenticação',
                    subTitle: 'Confirme o código de autorização',
                  ),
                  const SizedBox(height: 50),
                  OTPTextField(
                    length: 5,
                    width: MediaQuery.of(context).size.width / 2,
                    fieldWidth: 50,
                    style: const TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onCompleted: (pin) {
                      print("Completed: $pin");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: true,
                    child: Lottie.asset('assets/lottie/confirm.json'),
                  )
                ],
              ),
            ),

            // Mensagem Rodape
            SliverFillRemaining(
              hasScrollBody: false,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('VOLTAR'),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', (Route route) => false);
                      },
                      child: const Text('AVANÇAR'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
