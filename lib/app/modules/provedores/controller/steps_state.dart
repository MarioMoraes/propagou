import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:propagou/app/models/cep_model.dart';
import 'package:propagou/app/service/provedores/cep/cep_service.dart';

part 'steps_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class StepsState extends Equatable {
  final CepModel cep;
  final SearchStatus status;

  const StepsState._({
    required this.cep,
    required this.status,
  });

  StepsState.initial()
      : this._(
          cep: CepModel(),
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [cep, status];

  StepsState copyWith({
    CepModel? cep,
    SearchStatus? status,
  }) {
    return StepsState._(
      cep: cep ?? this.cep,
      status: status ?? this.status,
    );
  }
}
