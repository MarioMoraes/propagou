import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

sealed class Messages {
  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        iconPositionLeft: 30,
        iconRotationAngle: 0,
        backgroundColor: Colors.blue.shade700,
        textAlign: TextAlign.left,
        icon: const Icon(
          Icons.report,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  static void showError(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        iconPositionLeft: 30,
        iconRotationAngle: 0,
        backgroundColor: Colors.red.shade700,
        textAlign: TextAlign.left,
        icon: const Icon(
          Icons.cancel,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        iconPositionLeft: 30,
        iconRotationAngle: 0,
        backgroundColor: Colors.green.shade800,
        textAlign: TextAlign.left,
        icon: const Icon(
          Icons.done,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
