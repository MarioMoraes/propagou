import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:propagou/app/models/subtipo_model.dart';
import 'package:propagou/app/models/tipo_model.dart';
import 'package:propagou/app/service/splash/splash_service.dart';

part 'splash_state.dart';

class SplashController extends Cubit<SplashState> {
  final SplashService splashService;

  SplashController({required this.splashService})
      : super(SplashState.initial());

  Future<void> getData() async {
    emit(state.copyWith(
      listTipos: [],
      listSubTipos: [],
      status: SearchStatus.loading,
    ));

    await splashService.getTipos();
    await splashService.getSubTipos();
    print('teste');
  }
}
