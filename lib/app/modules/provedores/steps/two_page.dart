import 'package:flutter/material.dart';
import 'package:propagou/app/models/register_model.dart';
import 'package:propagou/app/modules/provedores/controller/provedor_state.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets/box_title.dart';
import '../../../core/widgets/my_widget.dart';

class TwoPage extends StatefulWidget {
  final ProvedorController provedorController;

  const TwoPage({Key? key, required this.provedorController}) : super(key: key);

  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  late RegisterModel registerModel;

  final _formKey = GlobalKey<FormState>();
  final _cepEC = TextEditingController();
  final _enderecoEC = TextEditingController();
  final _complementoEC = TextEditingController();
  final _bairroEC = TextEditingController();
  final _cidadeEC = TextEditingController();

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
    _cepEC.dispose();
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
                    subTitle: 'Informe Seu CEP',
                  ),
                  const SizedBox(height: 20),
                  MyWidget(
                    ec: _cepEC,
                    hint: 'CEP',
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
                            final model =
                                registerModel.copyWith(cep: _cepEC.text);
                            Navigator.pushNamed(context, '/three',
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
