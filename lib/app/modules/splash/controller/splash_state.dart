part of 'splash_controller.dart';

enum SearchStatus {
  initial,
  loading,
  empty,
  completed,
  failure,
}

class SplashState extends Equatable {
  final List<TipoModel> listTipos;
  final List<SubTipoModel> listSubTipos;
  final SearchStatus status;

  const SplashState._({
    required this.listTipos,
    required this.listSubTipos,
    required this.status,
  });

  SplashState.initial()
      : this._(
          listTipos: [],
          listSubTipos: [],
          status: SearchStatus.initial,
        );

  @override
  List<Object?> get props => [listTipos, listSubTipos, status];

  SplashState copyWith({
    List<TipoModel>? listTipos,
    List<SubTipoModel>? listSubTipos,
    SearchStatus? status,
  }) {
    return SplashState._(
      listTipos: listTipos ?? this.listTipos,
      listSubTipos: listSubTipos ?? this.listSubTipos,
      status: status ?? this.status,
    );
  }
}
