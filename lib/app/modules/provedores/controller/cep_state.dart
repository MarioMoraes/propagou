import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:propagou/app/models/cep_model.dart';
import 'package:propagou/app/service/provedores/cep/cep_service.dart';

part 'cep_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class CepState extends Equatable {
  final CepModel cep;
  final SearchStatus status;

  const CepState._({
    required this.cep,
    required this.status,
  });

  CepState.initial()
      : this._(
          cep: CepModel(
              cep: '',
              logradouro: '',
              complemento: '',
              bairro: '',
              localidade: '',
              uf: '',
              ibge: '',
              gia: '',
              ddd: '',
              siafi: ''),
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [cep, status];

  CepState copyWith({
    CepModel? cep,
    SearchStatus? status,
  }) {
    return CepState._(
      cep: cep ?? this.cep,
      status: status ?? this.status,
    );
  }
}
