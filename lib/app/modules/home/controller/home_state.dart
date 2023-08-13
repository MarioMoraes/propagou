import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/models/tipos_model.dart';
import 'package:propagou/app/service/tipos/tipo_service.dart';

import '../../../core/enums/search_status.dart';

part 'home_controller.dart';

class HomeState extends Equatable {
  final List<TiposModel> listTipos;
  final List<SubTipoModel> listSubTipos;
  final SearchStatus status;

  const HomeState._({
    required this.listTipos,
    required this.listSubTipos,
    required this.status,
  });

  HomeState.initial()
      : this._(
          listTipos: [],
          listSubTipos: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [listTipos, listSubTipos, status];

  HomeState copyWith({
    List<TiposModel>? listTipos,
    List<SubTipoModel>? listSubTipos,
    SearchStatus? status,
  }) {
    return HomeState._(
      listTipos: listTipos ?? this.listTipos,
      listSubTipos: listSubTipos ?? this.listSubTipos,
      status: status ?? this.status,
    );
  }
}
