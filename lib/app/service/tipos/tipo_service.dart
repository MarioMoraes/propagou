import 'package:propagou/app/models/tipo_model.dart';

import '../../models/subtipo_model.dart';

abstract class TipoService {
  Future<List<TipoModel>> getTipos();
  Future<List<SubTipoModel>> getSubTipos();
}
