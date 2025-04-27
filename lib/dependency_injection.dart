import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_hotel/controllers/login_controller.dart';
import 'package:smart_hotel/core/infrastructure/remote/dio_network_service.dart';
import 'package:smart_hotel/core/infrastructure/remote/network_service.dart';
import 'package:smart_hotel/core/util/app_client.dart';
import 'package:smart_hotel/services/login_service.dart';

import 'core/util/pref_utils.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => ApiClient());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPreferences);

  sl.registerLazySingleton<NetworkService>(() => DioNetworkService(sl()));
  sl.registerFactory<PrefUtils>(() => PrefUtilsImpl(sharedPreferences: sl()));

  // Features
  sl.registerLazySingleton(() => AuthService(sl()));
  //controllers
  sl.registerFactory(() => LoginController(sl()));
}
