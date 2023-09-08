part of 'cep_state.dart';

class CepController extends Cubit<CepState> {
  final CepService _cepService;

  CepController({required CepService cepService})
      : _cepService = cepService,
        super(CepState.initial());

  Future<void> getCep(String cep) async {
    try {
      emit(state.copyWith(status: SearchStatus.loading));
      final response = await _cepService.getCep(cep);
      emit(state.copyWith(cep: response, status: SearchStatus.completed));
    } on Exception {
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }
}
