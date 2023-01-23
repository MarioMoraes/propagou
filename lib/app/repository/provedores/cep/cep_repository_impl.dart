import 'package:dio/dio.dart';
import 'package:propagou/app/core/exceptions/repository_exception.dart';
import 'package:propagou/app/models/cep_model.dart';
import 'package:propagou/app/repository/provedores/cep/cep_repository.dart';

class CepRepositoryImpl extends CepRepository {
  final Dio _dio = Dio();

  @override
  Future<CepModel> getCep(String cep) async {
    try {
      final response = await _dio.get('https://viacep.com.br/ws/$cep/json/');

      if (response.statusCode == 200) {
        print(response);
      }
    } on DioError {
      throw RepositoryException();
    }
    return CepModel();
  }
}
