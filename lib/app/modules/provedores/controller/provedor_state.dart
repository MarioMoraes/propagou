import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:propagou/app/models/cep_model.dart';
import 'package:propagou/app/models/provedor_model.dart';
import 'package:propagou/app/service/provedores/cep/provedores/list_provedores_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/subtipo_model.dart';
import '../../../models/tipo_model.dart';

part 'provedor_controller.dart';

enum ProvedorStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class ProvedorState extends Equatable {
  final ProvedorStatus status;
  final List<String> tipos;
  final List<String> subtipos;
  final List<ProvedorModel>? provedores;

  const ProvedorState._({
    required this.tipos,
    required this.subtipos,
    required this.status,
    this.provedores,
  });

  ProvedorState.initial()
      : this._(
          status: ProvedorStatus.initial,
          tipos: [''],
          subtipos: [''],
        );

  @override
  List<Object?> get props => [status, tipos, subtipos];

  ProvedorState copyWith({
    CepModel? cep,
    ProvedorStatus? status,
    List<String>? tipos,
    List<String>? subtipos,
    List<ProvedorModel>? provedores,
  }) {
    return ProvedorState._(
      status: status ?? this.status,
      tipos: tipos ?? this.tipos,
      subtipos: subtipos ?? this.subtipos,
      provedores: provedores ?? this.provedores,
    );
  }
}
