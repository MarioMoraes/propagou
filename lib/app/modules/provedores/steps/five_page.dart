import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets/box_title.dart';
import '../../../core/widgets/custom_input.dart';
import '../../../models/register_model.dart';

class FivePage extends StatefulWidget {
  const FivePage({super.key});

  @override
  State<FivePage> createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> {
  late RegisterModel registerModel;

  final _formKey = GlobalKey<FormState>();
  final _instagramEC = TextEditingController();
  final _facebookEC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      registerModel =
          ModalRoute.of(context)?.settings.arguments as RegisterModel;
    });
    super.initState();
  }

  @override
  void dispose() {
    _instagramEC.dispose();
    _facebookEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  const BoxTitle(
                    title: 'Redes Sociais',
                    subTitle: 'Informe Suas Redes Sociais',
                  ),
                  const SizedBox(height: 20),
                  CustomInput(
                    ec: _instagramEC,
                    hint: 'Instagram',
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo Obrigatório'),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  CustomInput(
                    ec: _facebookEC,
                    hint: 'Facebook',
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo Obrigatório'),
                    ]),
                  ),
                ],
              ),
            ),

            // Mensagem Rodape
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          final valid =
                              _formKey.currentState?.validate() ?? false;

                          if (valid) {
                            var model = RegisterModel(
                              instagram: _instagramEC.text,
                              facebook: _facebookEC.text,
                            );

                            Navigator.pushNamed(context, '/six',
                                arguments: model);
                          }
                        },
                        child: const Text('AVANÇAR'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
