import '../../models/subtipo_model.dart';
import '../../models/tipo_model.dart';

abstract class TipoRepository {
  Future<List<TipoModel>> getTipos();
  Future<List<SubTipoModel>> getSubTipos();
}
