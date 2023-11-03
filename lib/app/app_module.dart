import 'package:flutter_modular/flutter_modular.dart';
import 'package:propagou/app/core/local_storage/local_storage_impl.dart';
import 'package:propagou/app/modules/home/home_module.dart';
import 'package:propagou/app/modules/splash/splash_module.dart';
import 'package:propagou/app/modules/subtipos/subtipos_module.dart';

import 'core/local_storage/local_storage.dart';
import 'modules/provedores/provedor_list_module.dart';
import 'modules/provedores/provedor_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<LocalStorage>(
          (i) => LocalStorageImpl(),
          export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/subtipos', module: SubtiposModule()),
        ModuleRoute('/provedor/register', module: ProvedorModule()),
        ModuleRoute('/provedor/list', module: ProvedorListModule()),
      ];
}
