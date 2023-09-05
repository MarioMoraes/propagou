import 'package:connectivity_plus/connectivity_plus.dart';

sealed class InternetConnection {
  static Future<bool> get hasInternet => _verifyConnection();

  static Future<bool> _verifyConnection() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      return true;
    } else {
      return false;
    }
  }
}
