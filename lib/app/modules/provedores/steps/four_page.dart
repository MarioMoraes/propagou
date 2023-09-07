import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:propagou/app/models/register_model.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets/box_title.dart';
import '../../../core/widgets/custom_input.dart';

class FourPage extends StatefulWidget {
  const FourPage({Key? key}) : super(key: key);

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _phoneEC = TextEditingController();

  late RegisterModel registerModel;

  var phoneNumberFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
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
    _emailEC.dispose();
    _phoneEC.dispose();
    super.dispose();
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
                    subTitle: 'Informe seu Email e Telefone',
                  ),
                  const SizedBox(height: 10),
                  CustomInput(
                    ec: _emailEC,
                    hint: 'Email',
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Email Obrigatório'),
                        Validatorless.email('Email Inválido')
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomInput(
                    ec: _phoneEC,
                    hint: 'Telefone',
                    inputFormatters: [phoneNumberFormatter],
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Telefone Obrigatório'),
                      ],
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
                          var model = registerModel.copyWith(
                            email: _emailEC.text,
                            phoneNumber: _phoneEC.text,
                          );

                          Navigator.pushNamed(context, '/five',
                              arguments: model);
                        }
                      },
                      child: const Text('AVANÇAR'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
