import 'package:flutter_modular/flutter_modular.dart';
import 'package:propagou/app/modules/provedores/provedor_module.dart';
import 'package:propagou/app/modules/subtipos/subtipos_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: ProvedorModule()),
        ModuleRoute('/subtipos', module: SubtiposModule()),
      ];
}
