import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class BoxTitle extends StatelessWidget {
  final String title;
  final String subTitle;

  const BoxTitle({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: const BoxDecoration(
        color: ColorConstants.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  color: ColorConstants.primary,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              subTitle,
              style: TextStyle(
                  fontSize: 12,
                  color: ColorConstants.primary.withOpacity(0.8),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
