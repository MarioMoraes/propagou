import 'package:flutter_modular/flutter_modular.dart';
import 'package:propagou/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
      ];
}
