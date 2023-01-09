import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:propagou/app/core/exceptions/repository_exception.dart';
import 'package:propagou/app/models/tipo_model.dart';
import 'package:propagou/app/repository/tipos/tipo_repository.dart';

class TipoRepositoryImpl extends TipoRepository {
  final _dio = Dio();

  @override
  Future<List<TipoModel>> getTipos() async {
    try {
      final response = await _dio.get('http://23.20.160.129/app/api/tipos.php');

      if (response.statusCode == 200) {
        return jsonDecode(response.data)
            .map<TipoModel>((e) => TipoModel.fromMap(e))
            .toList();
      }
    } on DioError {
      throw RepositoryException();
    }
    return [];
  }
}
