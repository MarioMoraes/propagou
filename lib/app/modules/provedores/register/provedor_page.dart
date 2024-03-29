import 'package:flutter/material.dart';
import 'package:propagou/app/modules/provedores/register/steps/five_page.dart';
import 'package:propagou/app/modules/provedores/register/steps/four_page.dart';
import 'package:propagou/app/modules/provedores/register/steps/one_page.dart';
import 'package:propagou/app/modules/provedores/register/steps/seven_page.dart';
import 'package:propagou/app/modules/provedores/register/steps/six_page.dart';

import '../controller/cep_state.dart';
import 'steps/three_page.dart';
import 'steps/two_page.dart';

class ProvedorPage extends StatefulWidget {
  final CepController controller;

  const ProvedorPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<ProvedorPage> createState() => _ProvedorPageState();
}

class _ProvedorPageState extends State<ProvedorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Cadastro de Prestadores'),
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: Navigator(
        initialRoute: '/one',
        onGenerateRoute: (settings) {
          var route = settings.name;
          Widget page;

          switch (route) {
            case '/one':
              page = const OnePage();
              break;
            case '/two':
              page = TwoPage(provedorController: widget.controller);
              break;
            case '/three':
              page = const ThreePage();
              break;
            case '/four':
              page = const FourPage();
              break;
            case '/five':
              page = const FivePage();
            case '/six':
              page = const SixPage();
            case '/seven':
              page = const SevenPage();

            default:
              return null;
          }
          return MaterialPageRoute(
            builder: (context) => page,
            settings: settings,
          );
        },
      ),
    );
  }
}
