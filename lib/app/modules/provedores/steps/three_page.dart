import 'package:flutter/material.dart';
import 'package:propagou/app/models/register_model.dart';
import 'package:propagou/app/modules/provedores/controller/provedor_state.dart';

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
                  Text(registerModel.nome!),
                  Text(registerModel.cep!),
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
