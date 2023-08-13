import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:propagou/app/core/exceptions/repository_exception.dart';
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/models/tipos_model.dart';
import 'package:propagou/app/repository/tipos/tipo_repository.dart';

class TipoRepositoryImpl extends TipoRepository {
  final _dio = Dio();

  @override
  Future<List<TiposModel>> getTipos() async {
    try {
      final response =
          await _dio.get('https://www.masterbusiness.adm.br/app/api/tipos.php');

      if (response.statusCode == 200) {
        return jsonDecode(response.data)
            .map<TiposModel>((e) => TiposModel.fromMap(e))
            .toList();
      }
    } on DioError catch (e, s) {
      log('Erro em Tipo/Subtipo', error: e, stackTrace: s);

      throw RepositoryException();
    }
    return [];
  }

  @override
  Future<List<SubTipoModel>> getSubTipos() async {
    try {
      final response = await _dio
          .get('https://www.masterbusiness.adm.br/app/api/subtipos.php');

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
