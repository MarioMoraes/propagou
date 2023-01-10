import 'package:propagou/app/models/subtipo_model.dart';

abstract class SubtipoService {
  Future<List<SubTipoModel>> getSubTipos(String tipo);
}
