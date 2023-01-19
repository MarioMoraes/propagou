import 'package:flutter/material.dart';

import 'steps/one_page.dart';
import 'steps/three_page.dart';
import 'steps/two_page.dart';

class ProvedorPage extends StatefulWidget {
  const ProvedorPage({Key? key}) : super(key: key);

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
              page = const OnePage();
              break;
            case '/two':
              page = const TwoPage();
              break;
            case '/three':
              page = const ThreePage();
              break;
            default:
              return null;
          }
          return MaterialPageRoute(builder: (context) => page);
        },
      ),
    );
  }
}
