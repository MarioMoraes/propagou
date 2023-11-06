import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:propagou/app/models/provedor_model.dart';

import '../../../core/exceptions/repository_exception.dart';
import 'list_provedores_repository.dart';

class ListProvedoresRepositoryImpl implements ListProvedoresRepository {
  final _dio = Dio();

  @override
  Future<List<ProvedorModel>> getProvedores(
    String tipo,
    String classificacao,
  ) async {
    const url = String.fromEnvironment('backend_base_url');

    try {
      final response = await _dio.get('$url/prestadores');

      return response.data
          .map<ProvedorModel>((e) => ProvedorModel.fromMap(e))
          .toList();
    } on DioError catch (e, s) {
      log('error in list provedores', error: e, stackTrace: s);
      throw RepositoryException();
    }
  }
}
