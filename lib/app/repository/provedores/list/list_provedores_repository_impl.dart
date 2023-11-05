import 'dart:convert';
import 'dart:developer';

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

      final convert1 = jsonDecode(response.data);
      print(convert1);
      final convert2 = convert1.map((e) => ProvedorModel.fromMap(e));
      print(convert2);
      print('');

//        return convert;
//      } else {
//        return throw RepositoryException();
//      }
    } on DioError catch (e, s) {
      log('error in list provedores', error: e, stackTrace: s);
      throw RepositoryException();
    }
    return [];
  }
}
