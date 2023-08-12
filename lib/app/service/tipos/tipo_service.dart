import 'package:propagou/app/models/tipos_model.dart';

abstract class TipoService {
  Future<List<TiposModel>> getTipos();
}
