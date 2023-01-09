import 'package:propagou/app/models/tipo_model.dart';

abstract class TipoRepository {
  Future<List<TipoModel>> getTipos();
}
