part of 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final TipoService tipoService;

  HomeController({required this.tipoService}) : super(HomeState.initial());

  Future<void> getTipos() async {
    final sp = await SharedPreferences.getInstance();
    dynamic responseSaved;
    dynamic response;

    try {
      emit(state.copyWith(
        listTipos: [],
        listSubTipos: [],
        status: SearchStatus.loading,
      ));

      if (sp.getStringList('tipos') != null) {
        responseSaved = sp.getStringList('tipos');
        response = jsonDecode(responseSaved ?? '[]');
      } else {
        response = await tipoService.getTipos();
      }

      emit(state.copyWith(listTipos: response));
    } on Exception {
      emit(state.copyWith(
        listTipos: [],
        listSubTipos: [],
        status: SearchStatus.failure,
      ));
    }
  }

  Future<void> getSubTipos() async {
    try {
      emit(state.copyWith(
        listSubTipos: [],
      ));

      final response = await tipoService.getSubTipos();

      emit(state.copyWith(
        listSubTipos: response,
        status: SearchStatus.completed,
      ));
    } on Exception {
      emit(state.copyWith(
        listTipos: [],
        listSubTipos: [],
        status: SearchStatus.failure,
      ));
    }
  }

  void changeItem(String id) {
    emit(state.copyWith(itemSelected: '1', status: SearchStatus.loading));
    emit(state.copyWith(
      itemSelected: id,
      listSubTipos: state.listSubTipos,
      status: SearchStatus.filtered,
    ));
  }

  String get itemSelected => state.itemSelected;
}
