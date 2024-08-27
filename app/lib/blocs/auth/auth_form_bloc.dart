import 'dart:async';

import 'package:app/model/auth_response.dart';
import 'package:bloc/bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:app/model/register_response.dart';
import 'package:app/model/user.model.dart';
import 'package:app/services/authService.dart';

import 'auth_form_event.dart';
import 'auth_form_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //final FlutterSecureStorage storage;
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignEmailAndPasswordEvent>(_authUserCredentiel);
    on<AuthGetCurrentUserEvent>(userProfile);
    on<AuthCreateUserEvent>(createdUser);

    on<AuthCheckTokenEvent>(checkTokenValidity);
    on<AuthVerifyOTPEvent>(verifyOtpCode);
    on<AuthSendOTPEvent>(sendOtpToUser);
  }
}

final authService = AuthService();
User user = User.empty();
Object authResponse = SuccessAuth.empty();
Object registerResponse = RegisterResponse.isEmpty();
ErrorAuth errorResponse = ErrorAuth.empty();
const storage = FlutterSecureStorage();

FutureOr<void> _authUserCredentiel(
    AuthSignEmailAndPasswordEvent event, Emitter<AuthState> emit) async {
  emit(AuthLoading());

  try {
    authResponse = await authService.login(event);
    SuccessAuth authSuccess = authResponse as SuccessAuth;
    emit(UsersuccessAuth(authSuccess: authResponse as SuccessAuth));
    await authService.saveTokenAndExpiry(
        authSuccess.accessToken!, authSuccess.refreshToken!, 24);
    print(authSuccess.refreshToken!);
  } catch (e) {
    emit(AuthError(errorAuth: errorResponse));
  }
}

FutureOr<void> createdUser(
    AuthCreateUserEvent event, Emitter<AuthState> emit) async {
  emit(AuthLoading());
  try {
    registerResponse = await authService.register(event);
    if (registerResponse is RegisterResponse) {
      RegisterResponse registerResponse2 = registerResponse as RegisterResponse;
      emit(AuthUserCreated(
          registerResponse: registerResponse as RegisterResponse));
      await authService.saveTokenAndExpiry(registerResponse2.data.accessToken!,
          registerResponse2.data.refreshToken!, 24);
    } else if (registerResponse is ErrorAuth) {
      emit(AuthError(errorAuth: registerResponse as ErrorAuth));
    }
  } catch (e) {
    emit(AuthError(errorAuth: ErrorAuth(message: e.toString(), status: 504)));
  }
}

FutureOr<void> userProfile(
    AuthGetCurrentUserEvent event, Emitter<AuthState> emit) async {
  emit(AuthLoading());
  try {
    final result = await authService.getCurrentUsers();
    if (result is RegisterResponse) {
      emit(AuthUserProfile(user: result.data));
    } else if (result is ErrorAuth) {
      emit(AuthError(errorAuth: result));
    }
  } catch (e) {
    emit(AuthError(errorAuth: ErrorAuth(message: e.toString(), status: 504)));
  }
}

//verifier si l'utilisateur est connecter ou non
Future<bool> isUserLoggedIn() async {
  final accessToken = await storage.read(key: 'accessToken');
  final refreshToken = await storage.read(key: 'refreshToken');
  if (accessToken != null && refreshToken != null) {
    return true;
  } else {
    return false;
  }
}

//verifier la validite du token
FutureOr<void> checkTokenValidity(
    AuthCheckTokenEvent event, Emitter<AuthState> emit) async {
  emit(AuthLoading());
  try {
    const storage = FlutterSecureStorage();
    final accessToken = await storage.read(key: 'accessToken') ?? ''; //
    final tokenExpiryString = await storage.read(key: 'tokenExpiry');
    final tokenExpiry =
        tokenExpiryString != null ? DateTime.parse(tokenExpiryString) : null;

    if (accessToken.isEmpty) {
      emit(NoAuth());
    } else if (accessToken.isNotEmpty &&
        tokenExpiry != null &&
        tokenExpiry.isAfter(DateTime.now())) {
      emit(AuthAuthenticated());
    } else {
      // Tente de rafraîchir le jeton (si nécessaire)
      final refreshSuccess = await authService.tryRefreshToken();
      if (refreshSuccess) {
        // Mettre à jour le token et sa date d'expiration après le rafraîchissement
        final newAccessToken = await storage.read(key: 'accessToken');
        final refreshToken = await storage.read(key: 'refreshToken');
        await authService.saveTokenAndExpiry(
            newAccessToken!, refreshToken!, 24);

        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    }
  } catch (e) {
    emit(AuthError(errorAuth: ErrorAuth(message: e.toString(), status: 504)));
  }
}

//send otp to user
FutureOr<void> sendOtpToUser(
    AuthSendOTPEvent event, Emitter<AuthState> emit) async {
  emit(AuthLoading());
  try {
    final result = await authService.reSendOtp(event);
    if (result is SuccessAuth) {
      emit(AuthOtpSend());
    } else if (result is ErrorAuth) {
      emit(AuthError(errorAuth: result));
    }
  } catch (e) {
    emit(AuthError(errorAuth: ErrorAuth(message: e.toString(), status: 504)));
  }
}

FutureOr<void> verifyOtpCode(
    AuthVerifyOTPEvent event, Emitter<AuthState> emit) async {
  emit(AuthLoading());
  try {
    final result = await authService.verifyOtp(event);
    if (result is SuccessAuth) {
      emit(AuthOtpVerified());
    } else if (result is ErrorOPTAuth) {
      emit(AuthError(
          errorAuth:
              ErrorAuth(message: result.message, status: result.status)));
    }
  } catch (e) {
    emit(AuthError(errorAuth: ErrorAuth(message: e.toString(), status: 504)));
  }
}
