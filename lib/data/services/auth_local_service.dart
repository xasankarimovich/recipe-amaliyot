
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/di/di.dart';
import '../models/auth/auth_response.dart';

class AuthLocalService {
  final _authKey = "tokenData";

  Future<void> saveToken(AuthResponse auth) async {
    final prefs = getIt.get<SharedPreferences>();
    await prefs.setString(_authKey, auth.token);
  }

  String? getToken() {
    final prefs = getIt.get<SharedPreferences>();
    return prefs.getString(_authKey);
  }

  Future<void> deleteToken() async {
    final prefs = getIt.get<SharedPreferences>();
    await prefs.remove(_authKey);
  }
}
