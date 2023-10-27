import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:propagou/app/core/constants/color_constants.dart';
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/widgets/box_title.dart';
import '../../../models/register_model.dart';
import '../../../models/tipo_model.dart';

class SixPage extends StatefulWidget {
  const SixPage({super.key});

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
    await _loadTipos();
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
                              _loadSubtipos(id: _tipoEC.text);
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

  Future<void> _loadTipos() async {
    // Load Tipos
    List<TipoModel> responseTemp;

    final sp = await SharedPreferences.getInstance();

    if (sp.getStringList('tipos') != null) {
      List<String> responseSaved = sp.getStringList('tipos') as List<String>;
      setState(() {
        responseTemp = responseSaved
            .map((notification) => TipoModel.fromJson(notification))
            .toList();

        responseTp = responseTemp.map((item) => item.descricao).toList();
      });
    }
  }

  Future<void> _loadSubtipos({required String id}) async {
    // Load Subtipos
    List<SubTipoModel> responseTmp;

    final sp = await SharedPreferences.getInstance();

    List<String> responseSaved = sp.getStringList('tipos') as List<String>;
    final jsonTmp = responseSaved
        .map((notification) => TipoModel.fromJson(notification))
        .toList();

    final found = jsonTmp.where((element) => element.descricao == id);

    if (sp.getStringList('subtipos') != null) {
      List<String> responseSaved = sp.getStringList('subtipos') as List<String>;
      setState(() {
        responseTmp = responseSaved
            .map((notification) => SubTipoModel.fromJson(notification))
            .toList();

        final responseJson =
            responseTmp.where((element) => element.grupoId == found.single.id);

        responseSub = responseJson.map((item) => item.grupo).toList();
      });
    }
  }
}
