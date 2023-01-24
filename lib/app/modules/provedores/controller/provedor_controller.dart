part of 'provedor_state.dart';

class ProvedorController extends Cubit<ProvedorState> {
  final CepService _cepService;

  ProvedorController({required CepService cepService})
      : _cepService = cepService,
        super(ProvedorState.initial());

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
