import 'package:flutter/material.dart';
import 'package:propagou/app/core/widgets/custom_input.dart';
import 'package:propagou/app/models/register_model.dart';
import 'package:propagou/app/modules/provedores/controller/provedor_state.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets/box_title.dart';

class ThreePage extends StatefulWidget {
  final ProvedorController provedorController;

  const ThreePage({Key? key, required this.provedorController})
      : super(key: key);

  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  late RegisterModel registerModel;

  final _formKey = GlobalKey<FormState>();
  final _docEC = TextEditingController();

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
    _docEC.dispose();
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
                    title: 'Dados Pessoais',
                    subTitle: 'Informe CPF ou CPNJ',
                  ),
                  const SizedBox(height: 10),
                  CustomInput(
                    ec: _docEC,
                    hint: 'CPF/CNPJ',
                    validator: Validatorless.multiple(
                      [
                        Validatorless.cnpj('CNPJ Invalido'),
                        Validatorless.cpf('CPF Invalido'),
                      ],
                    ),
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

                          if (valid) {}
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
