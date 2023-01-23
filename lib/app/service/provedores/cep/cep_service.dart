import 'package:propagou/app/models/cep_model.dart';

abstract class CepService {
  Future<CepModel> getCep(String cep);
}
