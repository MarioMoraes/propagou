import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';
import 'package:propagou/app/modules/provedores/controller/cep_state.dart';
import 'package:propagou/app/modules/provedores/provedor_page.dart';
import 'package:propagou/app/repository/provedores/cep/cep_repository.dart';
import 'package:propagou/app/repository/provedores/cep/cep_repository_impl.dart';
import 'package:propagou/app/service/provedores/cep/cep_service.dart';
import 'package:propagou/app/service/provedores/cep/cep_service_impl.dart';

class ProvedorModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<CepRepository>((i) => CepRepositoryImpl()),
        Bind.lazySingleton<CepService>(
            (i) => CepServiceImpl(cepRepository: i())),
        BlocBind.lazySingleton(
          (i) => CepController(cepService: i()),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => ProvedorPage(
            controller: Modular.get<CepController>(),
          ),
        ),
      ];
}
