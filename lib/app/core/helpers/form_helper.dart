import 'package:flutter/material.dart';

void unFocus(BuildContext context) {
  return FocusScope.of(context).unfocus();
}

extension UnFocusExtension on BuildContext {
  void unfocus() => FocusScope.of(this).unfocus();
}
