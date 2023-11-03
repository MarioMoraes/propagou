import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/box_title.dart';
import '../../../models/register_model.dart';

class SevenPage extends StatefulWidget {
  const SevenPage({super.key});

  @override
  State<SevenPage> createState() => _SevenPageState();
}

class _SevenPageState extends State<SevenPage> {
  late RegisterModel registerModel;
  bool _ended = false;

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
                    subTitle: 'Confirme o código que você recebeu pelo SMS',
                  ),
                  const Gap(50),
                  OTPTextField(
                    length: 5,
                    width: MediaQuery.of(context).size.width / 2,
                    fieldWidth: 50,
                    style: const TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceEvenly,
                    fieldStyle: FieldStyle.box,
                    onCompleted: (pin) {
                      setState(() {
                        _ended = true;
                      });
                    },
                  ),
                  const Gap(70),
                  Visibility(
                    visible: _ended,
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Lottie.asset('assets/lottie/confirm.json')),
                  ),
                  const Gap(80),
                  Center(
                    child: Visibility(
                        visible: _ended,
                        child: const Text(
                          'Cadastro Concluído!',
                          style: TextStyle(
                            fontSize: 22,
                            color: ColorConstants.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                            .animate()
                            .scaleXY(
                              begin: 0.0,
                              end: 1.0,
                              duration: 500.ms,
                              curve: Curves.decelerate,
                            )
                            .fadeIn()),
                  ),
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
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        print(registerModel);

                        Modular.to
                            .pushNamedAndRemoveUntil('/home', (p0) => false);
                      },
                      child: const Text('FINALIZAR'),
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
