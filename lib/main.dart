import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  ErrorWidget.builder = (details) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigoAccent,
        body: Container(
          alignment: Alignment.center,
          width: 250,
          height: 200,
          child: Text('Erro\n ${details.exception}'),
        ),
      ),
    );
  };

  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
