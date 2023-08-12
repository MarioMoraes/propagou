import 'package:propagou/app/models/tipos_model.dart';

abstract class TipoRepository {
  Future<List<TiposModel>> getTipos();
}
