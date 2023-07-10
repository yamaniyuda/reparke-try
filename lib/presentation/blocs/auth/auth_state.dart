part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateFailed extends AuthState {
  final String e;
  AuthStateFailed(this.e);
}

class AuthStateOtp extends AuthState {}

/// begin:: for sign up state
class AuthStateSingUpSuccess extends AuthState {}
class AuthStateVerifySignUpSuccess extends AuthState {}
/// end:: for sign up state

/// begin:: for sign in state
class AuthStateSignInSuccess extends AuthState  {}
/// end:: for sign in state


/// begin:: for forget pin
class AuthStateForgetPinSuccess extends AuthState {}
class AuthStateForgetPinOtpSuccess extends AuthState {}
class AuthStateResetPinSuccess extends AuthState {}
/// end:: for forget pin

class AuthStateSuccess extends AuthState {}