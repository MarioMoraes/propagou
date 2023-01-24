import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:propagou/app/core/styles/colors_app.dart';
import 'package:propagou/app/core/widgets/custom_text_form_field.dart';
import 'package:propagou/app/models/cep_model.dart';
import 'package:propagou/app/modules/provedores/controller/provedor_state.dart';
import 'package:quickalert/quickalert.dart';

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
  final _enderecoEC = TextEditingController();
  final _complementoEC = TextEditingController();
  final _bairroEC = TextEditingController();
  final _cidadeEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProvedorController, ProvedorState>(
      bloc: widget.provedorController,
      listener: (context, state) {
        if (state.status == SearchStatus.failure) {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Cep Inválido',
              text: 'Corrija e tente novamente...',
              confirmBtnText: 'Ok');
        }
        if (state.status == SearchStatus.loading) {
          LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.blue, size: 25);
        }
      },
      child: Scaffold(
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

                      const SizedBox(height: 20),
                      MyWidget(ec: _nomeEC, hint: 'Nome ou Razão Social'),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: Row(
                          children: [
                            MyWidget(ec: _cepEC, hint: 'CEP'),
                            const SizedBox(width: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: ElevatedButton(
                                  onPressed: () {
                                    widget.provedorController
                                        .getCep(_cepEC.text);
                                  },
                                  child: const Text('Buscar CEP')),
                            ),
                          ],
                        ),
                      ),

                      BlocSelector<ProvedorController, ProvedorState, CepModel>(
                        bloc: widget.provedorController,
                        selector: (state) => state.cep,
                        builder: (context, cep) {
                          _enderecoEC.text = cep.logradouro;
                          _complementoEC.text = cep.complemento;
                          _bairroEC.text = cep.bairro;
                          _cidadeEC.text = cep.localidade;

                          return Column(
                            children: [
                              const SizedBox(height: 10),
                              MyWidget(ec: _enderecoEC, hint: 'Endereço'),
                              const SizedBox(height: 10),
                              MyWidget(ec: _complementoEC, hint: 'Complemento'),
                              const SizedBox(height: 10),
                              MyWidget(ec: _bairroEC, hint: 'Bairro'),
                              const SizedBox(height: 10),
                              MyWidget(ec: _cidadeEC, hint: 'Cidade'),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
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
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final TextEditingController ec;
  final String hint;

  const MyWidget({super.key, required this.ec, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: CustomTextFormField(
        controller: ec,
        showIcon: false,
        hint: hint,
        onChange: (value) {},
      ),
    );
  }
}
