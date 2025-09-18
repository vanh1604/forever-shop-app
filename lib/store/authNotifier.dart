import 'package:first_project/api_service.dart';
import 'package:first_project/models/auth_state.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final ApiService _apiService;

  AuthNotifier(this._apiService) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    try {
      state = AuthLoading();
      final Map<String, dynamic> responseData = await _apiService.signIn(
        email,
        password,
      );
      final token = responseData['token'] as String;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', token);
      state = Authenticated(token);
    } catch (e) {
      state = AuthError(e.toString());
    }
  }
}
