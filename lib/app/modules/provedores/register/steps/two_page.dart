import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:propagou/app/core/helpers/messages.dart';
import 'package:propagou/app/core/widgets/box_title.dart';
import 'package:propagou/app/models/register_model.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/widgets/custom_input.dart';
import '../../../../core/widgets/custom_show.dart';
import '../../../../models/cep_model.dart';
import '../../controller/cep_state.dart';

class TwoPage extends StatefulWidget {
  final CepController provedorController;

  const TwoPage({Key? key, required this.provedorController}) : super(key: key);

  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  late RegisterModel registerModel;

  final _formKey = GlobalKey<FormState>();
  final _cepKey = GlobalKey<FormState>();
  final _cepEC = TextEditingController();
  final _numeroEC = TextEditingController();

  String? endereco;
  String? bairro;
  String? cidade;
  CepModel? dados;
  bool cepValidate = false;

  late FocusNode focusCep;
  late FocusNode focusNumero;

  var cepFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      registerModel =
          ModalRoute.of(context)?.settings.arguments as RegisterModel;
    });
    focusNumero = FocusNode();
    focusCep = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _cepEC.dispose();
    _numeroEC.dispose();
    focusCep.dispose();
    focusNumero.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CepController, CepState>(
      bloc: widget.provedorController,
      listener: (context, state) {
        if (state.status == SearchStatus.failure) {
          Messages.showError('CEP Inválido!', context);
          setState(() {
            cepValidate = false;
          });
          focusCep.requestFocus();
        }
        if (state.status == SearchStatus.completed) {
          setState(() {
            cepValidate = true;
          });
          focusNumero.requestFocus();
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
                      subTitle: 'Informe Seu CEP',
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _cepKey,
                      child: CustomInput(
                        focus: focusCep,
                        ec: _cepEC,
                        hint: 'CEP',
                        keyboardType: TextInputType.number,
                        inputFormatters: [cepFormatter],
                        validator: Validatorless.multiple([
                          Validatorless.required('Campo Obrigatório'),
                          Validatorless.min(8, 'Cep Inválido')
                        ]),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_cepEC.text.isNotEmpty) {
                                await widget.provedorController
                                    .getCep(_cepEC.text);
                              }
                            },
                            child: const Text('Buscar CEP')),
                      ),
                    ),
                    BlocSelector<CepController, CepState, CepModel>(
                      bloc: widget.provedorController,
                      selector: (state) => state.cep,
                      builder: (context, cep) {
                        dados = cep;

                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            CustomShow(ec: cep.logradouro),
                            const SizedBox(height: 10),
                            StatefulBuilder(
                              builder: (context, setState) {
                                return CustomInput(
                                  enabled: cepValidate,
                                  focus: focusNumero,
                                  ec: _numeroEC,
                                  hint: 'Número',
                                  validator: Validatorless.multiple([
                                    Validatorless.required('Número Obrigatório')
                                  ]),
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomShow(ec: cep.bairro),
                            const SizedBox(height: 10),
                            CustomShow(ec: cep.localidade),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Rodape
              SliverFillRemaining(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('VOLTAR'),
                      ),
                    ),
                    // const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          final valid =
                              _formKey.currentState?.validate() ?? false;

                          if (valid) {
                            var model = registerModel.copyWith(
                                endereco: dados?.logradouro,
                                cep: _cepEC.text,
                                numero: _numeroEC.text,
                                bairro: dados?.bairro,
                                cidade: dados?.localidade);

                            Navigator.pushNamed(context, '/three',
                                arguments: model);
                          }
                        },
                        child: const Text('AVANÇAR'),
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
