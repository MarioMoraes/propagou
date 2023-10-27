import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propagou/app/core/constants/color_constants.dart';
import 'package:propagou/app/modules/provedores/controller/provedor/provedor_state.dart';

import '../../../core/widgets/box_title.dart';
import '../../../models/register_model.dart';

class SixPage extends StatefulWidget {
  const SixPage({super.key});

  @override
  State<SixPage> createState() => _SixPageState();
}

class _SixPageState extends State<SixPage> {
  late RegisterModel registerModel;

  final ProvedorController provedorController = ProvedorController();

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
    await provedorController.loadTipos();
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
                        BlocSelector<ProvedorController, ProvedorState,
                            List<String>>(
                          bloc: provedorController,
                          selector: (state) => state.tipos,
                          builder: (context, state) {
                            return CustomDropdown(
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
                                  provedorController.loadSubtipos(
                                      id: _tipoEC.text);
                                });
                              },
                              items: state,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /*
                        BlocSelector<ProvedorController, ProvedorState,
                            List<String>>(
                          bloc: provedorController,
                          selector: (state) => state.subtipos,
                          builder: (context, state) {
                            return CustomDropdown(
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
                              items: state,
                            );
                          },
                        ),
                        */
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
