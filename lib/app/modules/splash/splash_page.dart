import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/constants/color_constants.dart';
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
    return BlocListener(
      bloc: widget.splashController,
      listener: (context, state) {
        switch (state) {
          case SearchStatus.loading:
            LoadingAnimationWidget.staggeredDotsWave(
              color: ColorConstants.primary,
              size: 35,
            );
          case SearchStatus.completed:
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Splash'),
        ),
        body: Container(),
      ),
    );
  }
}
