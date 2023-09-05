import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/models/tipo_model.dart';
import 'package:propagou/app/repository/splash/splash_repository.dart';

import '../../core/exceptions/repository_exception.dart';

class SplashRepositoryImpl implements SplashRepository {
  final Dio _dio = Dio();

  @override
  Future<List<TipoModel>> getTipos() async {
    try {
      final response =
          await _dio.get('https://www.masterbusiness.adm.br/app/api/tipos.php');

      if (response.statusCode == 200) {
        return jsonDecode(response.data)
            .map<TipoModel>((e) => TipoModel.fromMap(e))
            .toList();
      }
    } on DioError catch (e, s) {
      log('Erro Buscando Tipos...', error: e, stackTrace: s);
      throw RepositoryException();
    }
    return [];
  }

  @override
  Future<List<SubTipoModel>> getSubTipos() async {
    try {
      final response =
          await _dio.get('https://masterbusiness.adm.br/app/api/subtipos.php');

      if (response.statusCode == 200) {
        return jsonDecode(response.data)
            .map<SubTipoModel>((e) => SubTipoModel.fromMap(e))
            .toList();
      }
    } on DioError catch (e, s) {
      log('Erro Buscando Subtipos...', error: e, stackTrace: s);
      throw RepositoryException();
    }
    return [];
  }
}
