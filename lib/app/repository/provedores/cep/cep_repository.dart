import 'package:propagou/app/models/cep_model.dart';

abstract class CepRepository {
  Future<CepModel> getCep(String cep);
}
