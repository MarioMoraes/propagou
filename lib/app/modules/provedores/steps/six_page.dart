import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:propagou/app/core/constants/color_constants.dart';
import 'package:propagou/app/modules/provedores/controller/provedor/provedor_state.dart';

import '../../../core/widgets/box_title.dart';
import '../../../models/register_model.dart';

class SixPage extends StatefulWidget {
  final ProvedorController provedorController;

  const SixPage({super.key, required this.provedorController});

  @override
  State<SixPage> createState() => _SixPageState();
}

class _SixPageState extends State<SixPage> {
  late RegisterModel registerModel;
  List<String> responseTp = [''];
  List<String> responseSub = [''];

  final _tipoEC = TextEditingController();
  final _subtipoEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? selectedOption;

  @override
  void initState() {
    super.initState();

    _initLoad();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /*
      registerModel =
          ModalRoute.of(context)?.settings.arguments as RegisterModel;
      */
    });
  }

  _initLoad() async {
    await widget.provedorController.loadTipos();
  }

  @override
  void dispose() {
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
                    title: 'Categoria',
                    subTitle: 'Informe Sua Categoria e Classificação',
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CustomDropdown(
                          hintStyle: const TextStyle(
                              fontSize: 13, color: ColorConstants.primary),
                          listItemStyle: const TextStyle(
                              fontSize: 13, color: ColorConstants.primary),
                          borderSide: const BorderSide(
                              width: 1, color: ColorConstants.primary),
                          controller: _tipoEC,
                          hintText: 'Selecione a Categoria',
                          onChanged: (newValue) {
                            setState(() {
                              selectedOption = newValue;
                              widget.provedorController
                                  .loadSubtipos(id: _tipoEC.text);
                            });
                          },
                          items: responseTp,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomDropdown(
                          hintStyle: const TextStyle(
                              fontSize: 13, color: ColorConstants.primary),
                          listItemStyle: const TextStyle(
                              fontSize: 13, color: ColorConstants.primary),
                          borderSide: const BorderSide(
                              width: 1, color: ColorConstants.primary),
                          controller: _subtipoEC,
                          hintText: 'Selecione o Serviço Prestado',
                          onChanged: (newValue) {
                            setState(() {
                              selectedOption = newValue;
                            });
                          },
                          items: responseSub,
                        ),
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
                            Navigator.pushNamed(
                              context,
                              '/four',
                            );
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
