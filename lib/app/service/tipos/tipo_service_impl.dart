// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:propagou/app/models/tipo_model.dart';
import 'package:propagou/app/repository/tipos/tipo_repository.dart';
import 'package:propagou/app/service/tipos/tipo_service.dart';

class TipoServiceImpl extends TipoService {
  final TipoRepository _repository;

  TipoServiceImpl({
    required TipoRepository repository,
  }) : _repository = repository;

  @override
  Future<List<TipoModel>> getTipos() async => _repository.getTipos();
}
