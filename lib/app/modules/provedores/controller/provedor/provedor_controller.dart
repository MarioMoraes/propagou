part of 'provedor_state.dart';

class ProvedorController extends Cubit<ProvedorState> {
  ProvedorController() : super(ProvedorState.initial());

  Future<void> loadTipos() async {
    List<TipoModel> responseTemp;

    emit(
      state.copyWith(
        status: ProvedorStatus.initial,
        tipos: [],
        subtipos: [],
      ),
    );

    // Shared Pref
    final sp = await SharedPreferences.getInstance();

    // Get List Of Tipos Saved in Local Storage
    if (sp.getStringList('tipos') != null) {
      List<String> responseSaved = sp.getStringList('tipos') as List<String>;
      responseTemp = responseSaved
          .map((notification) => TipoModel.fromJson(notification))
          .toList();

      final responseTp = responseTemp.map((item) => item.descricao).toList();

      emit(
        state.copyWith(
          status: ProvedorStatus.completed,
          tipos: responseTp,
          subtipos: [],
        ),
      );
    }
  }

  Future<void> loadSubtipos({required String id}) async {
    List<SubTipoModel> responseTmp;

    emit(
      state.copyWith(
        status: ProvedorStatus.loading,
        subtipos: [],
      ),
    );

    // Shared Pref
    final sp = await SharedPreferences.getInstance();

    List<String> responseSaved = sp.getStringList('tipos') as List<String>;
    final jsonTmp = responseSaved
        .map((notification) => TipoModel.fromJson(notification))
        .toList();

    final found = jsonTmp.where((element) => element.descricao == id);

    if (sp.getStringList('subtipos') != null) {
      List<String> responseSaved = sp.getStringList('subtipos') as List<String>;
      responseTmp = responseSaved
          .map((notification) => SubTipoModel.fromJson(notification))
          .toList();

      final responseJson =
          responseTmp.where((element) => element.grupoId == found.single.id);

      final responseSub = responseJson.map((item) => item.grupo).toList();

      emit(
        state.copyWith(
          status: ProvedorStatus.completed,
          subtipos: responseSub,
        ),
      );
    }
  }
}
