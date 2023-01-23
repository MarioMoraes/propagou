part of 'steps_state.dart';

class StepsController extends Cubit<StepsState> {
  final CepService _cepService;

  StepsController({required CepService cepService})
      : _cepService = cepService,
        super(StepsState.initial());

  Future<void> getCep(String cep) async {
    emit(state.copyWith(status: SearchStatus.loading));
    final response = await _cepService.getCep(cep);
    emit(state.copyWith(cep: response, status: SearchStatus.completed));
  }
}
