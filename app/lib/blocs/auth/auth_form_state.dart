import 'package:equatable/equatable.dart';
import 'package:app/model/auth_response.dart';
import 'package:app/model/register_response.dart';
import 'package:app/model/user.model.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthCurrentUser extends AuthState {
  final User user;
  const AuthCurrentUser({required this.user});
}

class AuthAuthenticated extends AuthState {}

class AuthUnauthenticated extends AuthState {}

final class AuthUserCreated extends AuthState {
  final RegisterResponse registerResponse;
  const AuthUserCreated({required this.registerResponse});
}

final class AuthOtpVerified extends AuthState {
  //final String phoneNumber;
  //const AuthOtpVerified({required this.phoneNumber});

}

final class AuthOtpSend extends AuthState {}

final class AuthUserSuccess extends AuthState {
  final User user;
  const AuthUserSuccess({required this.user});
}

final class AuthError extends AuthState {
  final ErrorAuth errorAuth;
  const AuthError({required this.errorAuth});
}

final class NoAuth extends AuthState {}

//state for refresh access token
final class AuthRefreshToken extends AuthState {}

final class AuthRefreshTokenSuccess extends AuthState {}

final class AuthRefreshTokenError extends AuthState {}

final class AuthUserProfile extends AuthState {
  final User user;
  const AuthUserProfile({required this.user});
}

final class UsersuccessAuth extends AuthState {
  final SuccessAuth authSuccess;
  const UsersuccessAuth({required this.authSuccess});
}
