import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propagou/app/models/register_model.dart';
import 'package:propagou/app/modules/provedores/controller/provedor_state.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets/box_title.dart';
import '../../../core/widgets/custom_input.dart';
import '../../../core/widgets/custom_show.dart';
import '../../../models/cep_model.dart';

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
  final _numeroEC = TextEditingController();

  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      registerModel =
          ModalRoute.of(context)?.settings.arguments as RegisterModel;
    });
    myFocusNode = FocusNode();
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
                  CustomInput(
                    ec: _cepEC,
                    hint: 'CEP',
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo Obrigatório'),
                      Validatorless.min(8, 'Cep Inválido')
                    ]),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () async {
                            await widget.provedorController.getCep(_cepEC.text);
                            myFocusNode.requestFocus();
                          },
                          child: const Text('Buscar CEP')),
                    ),
                  ),
                  BlocSelector<ProvedorController, ProvedorState, CepModel>(
                    bloc: widget.provedorController,
                    selector: (state) => state.cep,
                    builder: (context, cep) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          CustomShow(ec: cep.logradouro),
                          const SizedBox(height: 10),
                          CustomInput(
                            focus: myFocusNode,
                            ec: _numeroEC,
                            hint: 'Número',
                            validator: Validatorless.multiple([
                              Validatorless.required('Número Obrigatório'),
                            ]),
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
/*                             var model = RegisterModel(nome: _nomeEC.text);
                            Navigator.pushNamed(context, '/two',
                                arguments: model);
 */
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
