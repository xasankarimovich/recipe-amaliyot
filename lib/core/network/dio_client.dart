import 'package:dio/dio.dart';

import '../../data/services/auth_local_service.dart';
import '../di/di.dart';
class DioClient {
  late Dio _dio;

  DioClient({required Dio dio}) {
    _dio = dio;
    _dio.options.baseUrl = "http://recipe.flutterwithakmaljon.uz/api";
    _dio.interceptors.add(NetworkInterceptor());
  }

  Dio get dio => _dio;
}

class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authLocalService = getIt.get<AuthLocalService>();
    final token = authLocalService.getToken();

    if (token != null) {
      options.headers = {
        "Authorization": "Bearer $token",
      };
    }

    super.onRequest(options, handler);
  }
}
