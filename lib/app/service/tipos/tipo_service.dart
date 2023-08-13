import 'package:propagou/app/models/tipos_model.dart';

import '../../models/subtipo_model.dart';

abstract class TipoService {
  Future<List<TiposModel>> getTipos();
  Future<List<SubTipoModel>> getSubTipos();
}
