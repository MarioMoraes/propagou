part of 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final TipoService tipoService;

  HomeController({required this.tipoService}) : super(HomeState.initial());

  Future<void> getTipos() async {
    try {
      emit(state.copyWith(listTipos: [], status: SearchStatus.loading));
      final response = await tipoService.getTipos();
      emit(state.copyWith(listTipos: response, status: SearchStatus.completed));
    } on Exception {
      emit(state.copyWith(listTipos: [], status: SearchStatus.failure));
    }
  }
}
