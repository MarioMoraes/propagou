import 'package:flutter_modular/flutter_modular.dart';
import 'package:propagou/app/modules/provedores/provedor_page.dart';

class ProvedorModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const ProvedorPage(),
        ),
      ];
}
