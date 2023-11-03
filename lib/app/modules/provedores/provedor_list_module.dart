import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:propagou/app/modules/provedores/controller/provedor_state.dart';
import 'package:propagou/app/modules/provedores/list/provedores_list_page.dart';
import 'package:propagou/app/repository/provedores/list/list_provedores_repository.dart';
import 'package:propagou/app/repository/provedores/list/list_provedores_repository_impl.dart';
import 'package:propagou/app/service/provedores/cep/provedores/list_provedores_service.dart';
import 'package:propagou/app/service/provedores/cep/provedores/list_provedores_service_impl.dart';

class ProvedorListModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Provedores
        Bind.lazySingleton<ListProvedoresRepository>(
            (i) => ListProvedoresRepositoryImpl()),

        Bind.lazySingleton<ListProvedoresService>(
            (i) => ListProvedoresServiceImpl(listProvedoresRepository: i())),

        // Provedor Controller
        BlocBind.lazySingleton((i) => ProvedorController(
            listProvedoresService: Modular.get<ListProvedoresService>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => ProvedoresListPage(
            provedorController: Modular.get<ProvedorController>(),
          ),
        ),
      ];
}
