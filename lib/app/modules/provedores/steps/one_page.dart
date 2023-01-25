import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:propagou/app/core/widgets/box_title.dart';
import 'package:propagou/app/models/register_model.dart';
import 'package:propagou/app/modules/provedores/controller/provedor_state.dart';
import 'package:quickalert/quickalert.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets/my_widget.dart';

class OnePage extends StatefulWidget {
  final ProvedorController provedorController;

  const OnePage({Key? key, required this.provedorController}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nomeEC.dispose();
  }

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
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    const BoxTitle(
                      title: 'Dados Pessoais',
                      subTitle: 'Informe Seu Nome ou Razão Social',
                    ),
                    const SizedBox(height: 20),
                    MyWidget(
                      ec: _nomeEC,
                      hint: 'Nome ou Razão Social',
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo Obrigatório'),
                        Validatorless.min(5, 'Minimo Requerido Não Atingido')
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
                              final model = RegisterModel(nome: _nomeEC.text);
                              Navigator.pushNamed(context, '/two',
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
      ),
    );
  }
}
