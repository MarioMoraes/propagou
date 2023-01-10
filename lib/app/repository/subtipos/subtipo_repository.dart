import 'package:propagou/app/models/subtipo_model.dart';

abstract class SubtipoRepository {
  Future<List<SubTipoModel>> getSubTipos(String tipo);
}
