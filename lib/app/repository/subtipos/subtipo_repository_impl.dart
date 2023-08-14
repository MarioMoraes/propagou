import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/repository/subtipos/subtipo_repository.dart';

import '../../core/exceptions/repository_exception.dart';

class SubtipoRepositoryImpl extends SubtipoRepository {
  final _dio = Dio();

  @override
  Future<List<SubTipoModel>> getSubTipos(String tipo) async {
    try {
      final response = await _dio.get(
          'https://masterbusiness.adm.br/app/api/subtipos_id.php',
          queryParameters: {'grupo_id': tipo});

      if (response.statusCode == 200) {
        return jsonDecode(response.data)
            .map<SubTipoModel>((e) => SubTipoModel.fromMap(e))
            .toList();
      }
    } on DioError {
      throw RepositoryException();
    }
    return [];
  }
}
