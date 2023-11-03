import 'package:propagou/app/models/provedor_model.dart';

abstract interface class ListProvedoresRepository {
  Future<List<ProvedorModel>> getProvedores(String tipo, String classificacao);
}
