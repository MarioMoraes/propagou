import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:propagou/app/models/cep_model.dart';
import 'package:propagou/app/service/provedores/cep/cep_service.dart';

part 'provedor_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class ProvedorState extends Equatable {
  final CepModel cep;
  final SearchStatus status;

  const ProvedorState._({
    required this.cep,
    required this.status,
  });

  ProvedorState.initial()
      : this._(
          cep: CepModel(),
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [cep, status];

  ProvedorState copyWith({
    CepModel? cep,
    SearchStatus? status,
  }) {
    return ProvedorState._(
      cep: cep ?? this.cep,
      status: status ?? this.status,
    );
  }
}
