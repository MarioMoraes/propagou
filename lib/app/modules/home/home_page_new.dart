import 'package:flutter/material.dart';
import 'package:propagou/app/core/constants/color_constants.dart';
import 'package:propagou/app/core/styles/text_styles.dart';

class HomePageNew extends StatelessWidget {
  const HomePageNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.menu,
                    color: ColorConstants.primary,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(child: Icon(Icons.verified_user)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20),
                child: Text(
                  'PROPAGOU',
                  style: context.textStyles.textPrimaryFontBold.copyWith(
                    fontSize: 22,
                    color: ColorConstants.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: TextFormField(),
              )
            ],
          ),
        ));
  }
}
