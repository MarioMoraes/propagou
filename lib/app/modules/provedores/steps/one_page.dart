import 'package:flutter/material.dart';
import 'package:propagou/app/core/styles/colors_app.dart';
import 'package:propagou/app/core/widgets/custom_text_form_field.dart';
import 'package:propagou/app/modules/provedores/controller/steps_state.dart';

class OnePage extends StatefulWidget {
  final StepsController stepsController;

  const OnePage({Key? key, required this.stepsController}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

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
                        controller: _emailEC,
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
                        controller: _emailEC,
                        showIcon: false,
                        hint: 'CEP',
                        onChange: (value) {},
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          widget.stepsController.getCep('37704280');
                        },
                        child: const Text('Buscar CEP'))
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
