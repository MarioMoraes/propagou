import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propagou/app/models/tipos_model.dart';
import 'package:propagou/app/service/tipos/tipo_service.dart';

import '../../../core/enums/search_status.dart';

part 'home_controller.dart';

class HomeState extends Equatable {
  final List<TiposModel> listTipos;
  final SearchStatus status;

  const HomeState._({
    required this.listTipos,
    required this.status,
  });

  HomeState.initial()
      : this._(
          listTipos: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [listTipos, status];

  HomeState copyWith({
    List<TiposModel>? listTipos,
    SearchStatus? status,
  }) {
    return HomeState._(
      listTipos: listTipos ?? this.listTipos,
      status: status ?? this.status,
    );
  }
}
