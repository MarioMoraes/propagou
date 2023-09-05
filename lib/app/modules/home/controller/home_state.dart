import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/models/tipo_model.dart';
import 'package:propagou/app/service/tipos/tipo_service.dart';

import '../../../core/enums/search_status.dart';

part 'home_controller.dart';

class HomeState extends Equatable {
  final List<TipoModel> listTipos;
  final List<SubTipoModel> listSubTipos;
  final SearchStatus status;
  final String itemSelected;

  const HomeState._({
    required this.listTipos,
    required this.listSubTipos,
    required this.status,
    required this.itemSelected,
  });

  HomeState.initial()
      : this._(
          listTipos: [],
          listSubTipos: [],
          status: SearchStatus.initial,
          itemSelected: '1',
        );

  @override
  List<Object?> get props => [listTipos, listSubTipos, itemSelected, status];

  HomeState copyWith({
    List<TipoModel>? listTipos,
    List<SubTipoModel>? listSubTipos,
    SearchStatus? status,
    String? itemSelected,
  }) {
    return HomeState._(
      listTipos: listTipos ?? this.listTipos,
      listSubTipos: listSubTipos ?? this.listSubTipos,
      status: status ?? this.status,
      itemSelected: itemSelected ?? this.itemSelected,
    );
  }
}
