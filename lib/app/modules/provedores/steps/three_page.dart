import 'package:flutter/material.dart';
import 'package:propagou/app/modules/provedores/controller/provedor_state.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets/box_title.dart';
import '../../../core/widgets/my_widget.dart';

class ThreePage extends StatefulWidget {
  final ProvedorController provedorController;

  const ThreePage({Key? key, required this.provedorController})
      : super(key: key);

  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  final _formKey = GlobalKey<FormState>();

  final _enderecoEC = TextEditingController();
  final _complementoEC = TextEditingController();
  final _bairroEC = TextEditingController();
  final _cidadeEC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _enderecoEC.dispose();
    _complementoEC.dispose();
    _bairroEC.dispose();
    _cidadeEC.dispose();
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
                    subTitle: 'Informe Seu Endereço',
                  ),
                  const SizedBox(height: 20),
                  MyWidget(
                    ec: _enderecoEC,
                    hint: 'Endereço',
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo Obrigatório'),
                      Validatorless.min(8, 'Cep Inválido')
                    ]),
                  ),
                  const SizedBox(height: 5),
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
                            Navigator.pushNamed(context, '/three');
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
