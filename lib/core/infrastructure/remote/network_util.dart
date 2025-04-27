import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkUtils {
  static Future<bool> hasInternetAccess() async {
    return await InternetConnection().hasInternetAccess;
  }
}
