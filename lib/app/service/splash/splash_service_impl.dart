import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/models/tipo_model.dart';
import 'package:propagou/app/repository/splash/splash_repository.dart';
import 'package:propagou/app/service/splash/splash_service.dart';

class SplashServiceImpl implements SplashService {
  final SplashRepository _repository;

  SplashServiceImpl({
    required SplashRepository repository,
  }) : _repository = repository;

  @override
  Future<List<TipoModel>> getTipos() async {
    final result = await _repository.getTipos();

    /// Save JSON in Local Storage

    return result;
  }

  @override
  Future<List<SubTipoModel>> getSubTipos() async {
    return await _repository.getSubTipos();
  }
}
