import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/service/subtipos/subtipo_service.dart';

part 'subtipos_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class SubTipoState extends Equatable {
  final List<SubTipoModel> listSubTipos;
  final SearchStatus status;

  const SubTipoState._({
    required this.listSubTipos,
    required this.status,
  });

  SubTipoState.initial()
      : this._(
          listSubTipos: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [listSubTipos, status];

  SubTipoState copyWith({
    List<SubTipoModel>? listSubTipos,
    SearchStatus? status,
  }) {
    return SubTipoState._(
      listSubTipos: listSubTipos ?? this.listSubTipos,
      status: status ?? this.status,
    );
  }
}
