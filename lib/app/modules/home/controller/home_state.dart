import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propagou/app/models/tipo_model.dart';
import 'package:propagou/app/service/tipos/tipo_service.dart';

part 'home_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class HomeState extends Equatable {
  final List<TipoModel> listTipos;
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
    List<TipoModel>? listTipos,
    SearchStatus? status,
  }) {
    return HomeState._(
      listTipos: listTipos ?? this.listTipos,
      status: status ?? this.status,
    );
  }
}
