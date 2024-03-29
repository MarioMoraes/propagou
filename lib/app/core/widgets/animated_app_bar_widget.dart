import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedAppBarWidget extends StatelessWidget {
  final String name;
  final Duration appBarPlayTime;
  final Duration appBarDelayTime;
  const AnimatedAppBarWidget({
    Key? key,
    required this.name,
    required this.appBarPlayTime,
    required this.appBarDelayTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              )),
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black, fontSize: 18),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.more_vert_rounded,
                size: 20,
              )),
        ].animate(interval: 200.ms, delay: appBarDelayTime).scaleXY(
            begin: 0,
            end: 1,
            duration: appBarPlayTime,
            curve: Curves.decelerate));
  }
}
