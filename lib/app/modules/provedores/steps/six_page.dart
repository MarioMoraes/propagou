import 'package:flutter/material.dart';
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/widgets/box_title.dart';
import '../../../models/register_model.dart';

class SixPage extends StatefulWidget {
  const SixPage({super.key});

  @override
  State<SixPage> createState() => _SixPageState();
}

class _SixPageState extends State<SixPage> {
  late RegisterModel registerModel;
  List<String> response = [];

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
    await _loadData();
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
                  Column(
                    children: [
                      DropdownButton<String>(
                        isDense: true,
                        value: selectedOption,
                        onChanged: (newValue) {
                          setState(() {
                            selectedOption = newValue;
                          });
                        },
                        items: response.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                      ),
                    ],
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

  Future<void> _loadData() async {
    List<SubTipoModel> responseTemp;

    final sp = await SharedPreferences.getInstance();
    if (sp.getStringList('subtipos') != null) {
      List<String> responseSaved = sp.getStringList('subtipos') as List<String>;
      setState(() {
        responseTemp = responseSaved
            .map((notification) => SubTipoModel.fromJson(notification))
            .toList();

        response = responseTemp.map((item) => item.grupo).toList();
      });
    }
  }
}
