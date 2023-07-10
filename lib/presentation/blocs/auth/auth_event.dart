part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthEventSignIn extends AuthEvent {
  final SignInPayload data;
  AuthEventSignIn(this.data);
}

class AuthEventSignUp extends AuthEvent {
  final SignUpPayload data;
  AuthEventSignUp(this.data);
}

class AuthEventVerifySignUp extends AuthEvent {
  final VerifySignUpPayload data;
  AuthEventVerifySignUp(this.data);
}

class AuthEventSendOtp extends AuthEvent {
  final SendOtpPayload data;
  AuthEventSendOtp(this.data);
}

class AuthEventForgetPin extends AuthEvent {
  final SendOTPResetPinPayload data;
  AuthEventForgetPin(this.data);
}

class AuthEventVerifyResetPin extends AuthEvent {
  final VerifyResetPinPayload data;
  AuthEventVerifyResetPin(this.data);
}

class AuthEventResetPin extends AuthEvent {
  final NewPinPayload data;
  AuthEventResetPin(this.data);
}