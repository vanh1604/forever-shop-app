import 'package:first_project/api_service.dart';
import 'package:first_project/models/auth_state.dart';
import 'package:first_project/models/user.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final ApiService _apiService;

  AuthNotifier(this._apiService) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    try {
      state = AuthLoading();
      final Map<String, dynamic> authDataMap = await _apiService.signIn(
        email,
        password,
      );
      final user = User.fromJson(authDataMap['user']);

      state = Authenticated(user);
    } catch (e) {
      state = AuthError(e.toString());
    }
  }
}
