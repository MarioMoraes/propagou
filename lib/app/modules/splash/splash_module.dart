import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:propagou/app/modules/splash/controller/splash_controller.dart';
import 'package:propagou/app/modules/splash/splash_page.dart';
import 'package:propagou/app/repository/splash/splash_repository.dart';
import 'package:propagou/app/service/splash/splash_service.dart';
import 'package:propagou/app/service/splash/splash_service_impl.dart';

import '../../repository/splash/splash_repository_impl.dart';

class SplashModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<SplashRepository>((i) => SplashRepositoryImpl()),
        Bind.lazySingleton<SplashService>(
            (i) => SplashServiceImpl(repository: i())),
        BlocBind.lazySingleton((i) => SplashController(splashService: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => SplashPage(
            splashController: Modular.get<SplashController>(),
          ),
        ),
      ];
}
