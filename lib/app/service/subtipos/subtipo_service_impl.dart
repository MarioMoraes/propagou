// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/repository/subtipos/subtipo_repository.dart';
import 'package:propagou/app/service/subtipos/subtipo_service.dart';

class SubtipoServiceImpl extends SubtipoService {
  final SubtipoRepository _subtipoRepository;

  SubtipoServiceImpl({
    required SubtipoRepository subtipoRepository,
  }) : _subtipoRepository = subtipoRepository;

  @override
  Future<List<SubTipoModel>> getSubTipos(String tipo) async =>
      _subtipoRepository.getSubTipos(tipo);
}
