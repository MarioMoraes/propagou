import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:propagou/app/core/constants/color_constants.dart';
import 'package:propagou/app/core/widgets/custom_input.dart';
import 'package:propagou/app/models/register_model.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets/box_title.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({Key? key}) : super(key: key);

  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  late RegisterModel registerModel;
  int? selectedValue = 1;

  final _formKey = GlobalKey<FormState>();
  final _docEC = TextEditingController();

  var cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  var cnpjFormatter = MaskTextInputFormatter(
    mask: '##.###.###/####-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

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
                    subTitle: 'Informe CPF ou CNPJ',
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: <Widget>[
                      RadioListTile(
                        dense: true,
                        title: const Text(
                          "CPF",
                          style: TextStyle(color: ColorConstants.primary),
                        ),
                        value: 1,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                      RadioListTile(
                        dense: true,
                        title: const Text(
                          "CNPJ",
                          style: TextStyle(color: ColorConstants.primary),
                        ),
                        value: 2,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: selectedValue == 1,
                    child: CustomInput(
                      ec: _docEC,
                      keyboardType: TextInputType.number,
                      inputFormatters: [cpfFormatter],
                      hint: 'CPF',
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required('CPF Obrigatório'),
                          Validatorless.cpf('CPF Invalido'),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: selectedValue == 2,
                    child: CustomInput(
                      ec: _docEC,
                      inputFormatters: [cnpjFormatter],
                      hint: 'CNPJ',
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required('CNPJ Obrigatório'),
                          Validatorless.cnpj('CNPJ Invalido'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Mensagem Rodape
            SliverFillRemaining(
                hasScrollBody: false,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            var model =
                                registerModel.copyWith(doc: _docEC.text);

                            Navigator.pushNamed(context, '/five',
                                arguments: model);
                          }
                        },
                        child: const Text('AVANÇAR'),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
