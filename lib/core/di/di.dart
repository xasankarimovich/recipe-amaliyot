
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../../data/services/auth_api_service.dart';
import '../../data/services/auth_local_service.dart';
import '../../data/services/user_service.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;

Future<void> dependencyInit() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => prefs);
  getIt.registerLazySingleton(() => DioClient(dio: Dio()));

  // Services
  getIt.registerLazySingleton(() => AuthApiService());
  getIt.registerLazySingleton(() => AuthLocalService());
  getIt.registerLazySingleton(() => UserService());

  // Repositories
  getIt.registerSingleton(
    AuthRepository(
      authApiService: getIt.get<AuthApiService>(),
      authLocalService: getIt.get<AuthLocalService>(),
    ),
  );

  getIt.registerSingleton(
    UserRepository(
      userService: getIt.get<UserService>(),
    ),
  );
}
