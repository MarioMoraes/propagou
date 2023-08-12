import 'package:propagou/app/models/tipos_model.dart';
import 'package:propagou/app/repository/tipos/tipo_repository.dart';
import 'package:propagou/app/service/tipos/tipo_service.dart';

class TipoServiceImpl extends TipoService {
  final TipoRepository _repository;

  TipoServiceImpl({
    required TipoRepository repository,
  }) : _repository = repository;

  @override
  Future<List<TiposModel>> getTipos() async => _repository.getTipos();
}
