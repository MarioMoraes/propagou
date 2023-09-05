import '../../models/subtipo_model.dart';
import '../../models/tipo_model.dart';

abstract interface class SplashRepository {
  Future<List<TipoModel>> getTipos();
  Future<List<SubTipoModel>> getSubTipos();
}
