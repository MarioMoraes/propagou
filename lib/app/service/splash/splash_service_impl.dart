import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/models/tipo_model.dart';
import 'package:propagou/app/repository/splash/splash_repository.dart';
import 'package:propagou/app/service/splash/splash_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServiceImpl implements SplashService {
  final SplashRepository _repository;

  SplashServiceImpl({
    required SplashRepository repository,
  }) : _repository = repository;

  @override
  Future<List<TipoModel>> getTipos() async {
    final result = await _repository.getTipos();

    /// Save JSON in Local Storage
    ///
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final tiposJson = result.map((tipo) => tipo.toJson()).toList();
    prefs.setStringList('tipos', tiposJson);

    return result;
  }

  @override
  Future<List<SubTipoModel>> getSubTipos() async {
    final result = await _repository.getSubTipos();

    /// Save JSON in Local Storage
    ///
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final subTiposJson = result.map((subtipo) => subtipo.toJson()).toList();
    prefs.setStringList('subtipos', subTiposJson);

    return result;
  }
}
