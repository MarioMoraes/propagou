import 'package:flutter_modular/flutter_modular.dart';
import 'package:propagou/app/modules/home/home_module.dart';
import 'package:propagou/app/modules/subtipos/subtipos_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/subtipos', module: SubtiposModule()),
      ];
}
