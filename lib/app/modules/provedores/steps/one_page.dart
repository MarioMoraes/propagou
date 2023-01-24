import 'package:flutter/material.dart';
import 'package:propagou/app/core/styles/colors_app.dart';
import 'package:propagou/app/core/widgets/custom_text_form_field.dart';
import 'package:propagou/app/modules/provedores/controller/provedor_state.dart';

class OnePage extends StatefulWidget {
  final ProvedorController provedorController;

  const OnePage({Key? key, required this.provedorController}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeEC = TextEditingController();
  final _cepEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    // Titulo
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: context.colors.background,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Informe Seu Dados Pessoais',
                          style: TextStyle(
                              fontSize: 16,
                              color: context.colors.primary,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // TextFormField
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: CustomTextFormField(
                        controller: _nomeEC,
                        showIcon: false,
                        hint: 'Nome ou Razão Social',
                        onChange: (value) {},
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: CustomTextFormField(
                        controller: _cepEC,
                        showIcon: false,
                        hint: 'CEP',
                        onChange: (value) {},
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: ElevatedButton(
                          onPressed: () {
                            widget.provedorController.getCep(_cepEC.text);
                          },
                          child: const Text('Buscar CEP')),
                    )
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
                          onPressed: () {},
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
      ),
    );
  }
}
