import 'package:connectivity_plus/connectivity_plus.dart';

class CheckInternet {
  //to make the class singleton and create only one instance:
  CheckInternet._internal();

  static final CheckInternet instance = CheckInternet._internal();

  factory CheckInternet() => instance;

  //------------------------------------------------
  static Future<bool> checkInternet(context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) () => true;
    return false;
  }
}
