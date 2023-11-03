import '../../../../models/provedor_model.dart';

abstract interface class ListProvedoresService {
  Future<List<ProvedorModel>> getProvedores(String tipo, String classificacao);
}
