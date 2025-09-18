import 'package:first_project/models/user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String token;
  Authenticated(this.token);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
