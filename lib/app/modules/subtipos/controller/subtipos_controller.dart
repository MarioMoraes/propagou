part of 'subtipos_state.dart';

class SubTiposController extends Cubit<SubTipoState> {
  final SubtipoService subtipoService;

  SubTiposController({required this.subtipoService})
      : super(SubTipoState.initial());

  Future<void> getSubTipos(String tipo) async {
    try {
      emit(state.copyWith(listSubTipos: [], status: SearchStatus.loading));
      final response = await subtipoService.getSubTipos(tipo);
      emit(state.copyWith(
          listSubTipos: response, status: SearchStatus.completed));
    } on Exception {
      emit(state.copyWith(listSubTipos: [], status: SearchStatus.failure));
    }
  }
}
