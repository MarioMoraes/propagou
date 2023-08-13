import 'package:propagou/app/models/tipos_model.dart';

import '../../models/subtipo_model.dart';

abstract class TipoRepository {
  Future<List<TiposModel>> getTipos();
  Future<List<SubTipoModel>> getSubTipos();
}
