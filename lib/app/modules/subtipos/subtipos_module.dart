import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:propagou/app/modules/subtipos/controller/subtipos_state.dart';
import 'package:propagou/app/modules/subtipos/subtipos_page.dart';
import 'package:propagou/app/repository/subtipos/subtipo_repository.dart';
import 'package:propagou/app/repository/subtipos/subtipo_repository_impl.dart';
import 'package:propagou/app/service/subtipos/subtipo_service.dart';
import 'package:propagou/app/service/subtipos/subtipo_service_impl.dart';

class SubtiposModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<SubtipoRepository>((i) => SubtipoRepositoryImpl()),
        Bind.lazySingleton<SubtipoService>(
            (i) => SubtipoServiceImpl(subtipoRepository: i())),
        BlocBind.lazySingleton((i) => SubTiposController(subtipoService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => SubtiposPage(
            subTiposController: Modular.get<SubTiposController>(),
            args: args.data,
          ),
        ),
      ];
}
