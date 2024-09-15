import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:app/model/user.model.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class EmailChanged extends AuthEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

final class EmailUnfocused extends AuthEvent {}

final class PasswordChanged extends AuthEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

final class PasswordUnfocused extends AuthEvent {}

final class FormSubmitted extends AuthEvent {}

final class AuthVerifyOTPEvent extends AuthEvent {
  final String phoneNumber, otp;

  const AuthVerifyOTPEvent(this.phoneNumber, this.otp);
}

//event for send otp to phone number
final class AuthSendOTPEvent extends AuthEvent {
  final String phoneNumber;
  const AuthSendOTPEvent(this.phoneNumber);
}

final class AuthGetCurrentUserEvent extends AuthEvent {
  // final String token;
  // const AuthGetCurrentUserEvent({required this.token});
  //const AuthGetCurrentUserEvent();
}

final class AuthSignEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthSignEmailAndPasswordEvent(this.email, this.password);
  @override
  List<Object> get props => [];
}

final class AuthCreateUserEvent extends AuthEvent {
  final User user;
  final File file;
  const AuthCreateUserEvent(this.user, this.file);
}

final class AuthCheckTokenEvent extends AuthEvent {}

final class AuthRefreshtokenEvent extends AuthEvent {}

final class AuthSignOutEvent extends AuthEvent {}

