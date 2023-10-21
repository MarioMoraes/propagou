import 'package:flutter/material.dart';

extension EmptyPadding on double {
  SizedBox get pw => SizedBox(width: this);
  SizedBox get ph => SizedBox(height: this);
}
