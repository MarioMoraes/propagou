import 'package:flutter_modular/flutter_modular.dart';
import 'package:propagou/app/modules/subtipos/subtipos_page.dart';

class SubtiposModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const SubtiposPage()),
      ];
}
