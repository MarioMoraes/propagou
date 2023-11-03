import 'package:dio/dio.dart';
import 'package:propagou/app/models/provedor_model.dart';

import '../../../core/exceptions/repository_exception.dart';
import 'list_provedores_repository.dart';

class ListProvedoresRepositoryImpl implements ListProvedoresRepository {
  final _dio = Dio();

  @override
  Future<List<ProvedorModel>> getProvedores(
      String tipo, String classificacao) async {
    try {
      final response = await _dio.get('http://localhost:8080/prestadores');

      if (response.statusCode == 200 && response.data['erro'] != 'true') {
        final convert =
            response.data((e) => ProvedorModel.fromJson(e)).toList();
        print(convert);
        return convert;
      } else {
        return throw RepositoryException();
      }
    } on DioError {
      throw RepositoryException();
    }
  }
}
