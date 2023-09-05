import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/models/tipo_model.dart';

abstract interface class SplashService {
  Future<List<TipoModel>> getTipos();
  Future<List<SubTipoModel>> getSubTipos();
}
