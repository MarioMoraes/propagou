import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:propagou/app/modules/home/controller/home_state.dart';
import 'package:propagou/app/modules/home/home_page.dart';
import 'package:propagou/app/modules/provedores/controller/steps_state.dart';
import 'package:propagou/app/modules/provedores/provedor_page.dart';
import 'package:propagou/app/repository/tipos/tipo_repository.dart';
import 'package:propagou/app/repository/tipos/tipo_repository_impl.dart';
import 'package:propagou/app/service/tipos/tipo_service.dart';
import 'package:propagou/app/service/tipos/tipo_service_impl.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<TipoRepository>((i) => TipoRepositoryImpl()),
        Bind.lazySingleton<TipoService>(
            (i) => TipoServiceImpl(repository: i())),
        BlocBind.lazySingleton((i) => StepsController(cepService: i())),
        Bind.lazySingleton<TipoService>(
            (i) => TipoServiceImpl(repository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => HomePage(
            homeController: Modular.get<HomeController>(),
          ),
        ),
        ChildRoute(
          '/provedor',
          child: (_, args) => ProvedorPage(
            controller: Modular.get<StepsController>(),
          ),
        ),
      ];
}
