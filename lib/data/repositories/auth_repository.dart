
import '../models/auth/login_request.dart';
import '../models/auth/register_request.dart';
import '../models/auth/social_login_request.dart';
import '../services/auth_api_service.dart';
import '../services/auth_local_service.dart';

class AuthRepository {
  final AuthApiService authApiService;
  final AuthLocalService authLocalService;

  AuthRepository({
    required this.authApiService,
    required this.authLocalService,
  });

  Future<void> register(RegisterRequest request) async {
    final authResponse = await authApiService.register(request);
    await authLocalService.saveToken(authResponse);
  }

  Future<void> login(LoginRequest request) async {
    final authResponse = await authApiService.login(request);
    await authLocalService.saveToken(authResponse);
  }

  Future<void> socialLogin(SocialLoginRequest request) async {
    final authResponse = await authApiService.socialLogin(request);
    await authLocalService.saveToken(authResponse);
  }

  Future<void> logout() async {
    await authApiService.logout();
    await authLocalService.deleteToken();
  }
}