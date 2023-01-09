import '../../models/tipo_model.dart';

abstract class TipoService {
  Future<List<TipoModel>> getTipos();
}
