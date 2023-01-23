// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:propagou/app/models/cep_model.dart';
import 'package:propagou/app/repository/provedores/cep/cep_repository.dart';
import 'package:propagou/app/service/provedores/cep/cep_service.dart';

class CepServiceImpl extends CepService {
  final CepRepository _cepRepository;

  CepServiceImpl({
    required CepRepository cepRepository,
  }) : _cepRepository = cepRepository;

  @override
  Future<CepModel> getCep(String cep) async => _cepRepository.getCep(cep);
}
