import 'package:flutter/material.dart';

extension EmptyPadding on double {
  SizedBox get width => SizedBox(width: this);
  SizedBox get height => SizedBox(height: this);
}
