import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:propagou/app/core/constants/color_constants.dart';
import 'package:propagou/app/core/constants/image_constants.dart';

import 'controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  final SplashController splashController;

  const SplashPage({super.key, required this.splashController});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    await widget.splashController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashController, SplashState>(
      bloc: widget.splashController,
      listener: (context, state) {
        if (state.status == SearchStatus.loading) {
          LoadingAnimationWidget.threeRotatingDots(
              color: ColorConstants.primary, size: 24);
        }
        if (state.status == SearchStatus.completed) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        }
      },
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstants.wallpaper),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocSelector<SplashController, SplashState, bool>(
            bloc: widget.splashController,
            selector: (state) => state.status == SearchStatus.loading,
            builder: (context, showLoading) {
              return Visibility(
                visible: showLoading,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                        color: ColorConstants.secondary, size: 35),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
