import 'package:flutter/material.dart';
import 'package:propagou/app/modules/provedores/controller/provedor_state.dart';
import 'package:propagou/app/modules/provedores/steps/four_page.dart';

import 'steps/one_page.dart';
import 'steps/three_page.dart';
import 'steps/two_page.dart';

class ProvedorPage extends StatefulWidget {
  final ProvedorController controller;

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
        title: const Text('Cadastro'),
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
              page = OnePage(provedorController: widget.controller);
              break;
            case '/two':
              page = TwoPage(provedorController: widget.controller);
              break;
            case '/three':
              page = ThreePage(provedorController: widget.controller);
              break;
            case '/four':
              page = const FourPage();
              break;

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
