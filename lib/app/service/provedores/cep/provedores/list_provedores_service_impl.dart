import 'package:propagou/app/models/provedor_model.dart';
import 'package:propagou/app/repository/provedores/list/list_provedores_repository.dart';
import 'package:propagou/app/service/provedores/cep/provedores/list_provedores_service.dart';

class ListProvedoresServiceImpl implements ListProvedoresService {
  final ListProvedoresRepository listProvedoresRepository;

  ListProvedoresServiceImpl({required this.listProvedoresRepository});

  @override
  Future<List<ProvedorModel>> getProvedores(String classificacao) =>
      listProvedoresRepository.getProvedores(classificacao);
}
