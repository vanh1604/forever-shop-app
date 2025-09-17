// file: lib/models/auth_state.dart
import 'package:first_project/models/user.dart'; // Giả sử bạn có model User

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
