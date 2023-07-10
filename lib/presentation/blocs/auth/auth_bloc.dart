import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:reparke/data/payloads/new_pin_payload.dart';
import 'package:reparke/data/payloads/reset_pin_payload.dart';
import 'package:reparke/data/payloads/send_otp_payload.dart';
import 'package:reparke/data/payloads/send_otp_reset_pin_payload.dart';
import 'package:reparke/data/payloads/sign_in_payload.dart';
import 'package:reparke/data/payloads/sign_up_payload.dart';
import 'package:reparke/data/payloads/verify_reset_pin_payload.dart';
import 'package:reparke/data/payloads/verify_sign_up_payload.dart';
import 'package:reparke/domain/entities/auth_entity.dart';
import 'package:reparke/domain/entities/user_entity.dart';
import 'package:reparke/domain/use_cases/auth/get_current_user_use_case.dart';
import 'package:reparke/domain/use_cases/auth/new_pin_use_case.dart';
import 'package:reparke/domain/use_cases/auth/send_otp_reset_pin_payload.dart';
import 'package:reparke/domain/use_cases/auth/send_otp_use_case.dart';
import 'package:reparke/domain/use_cases/auth/sign_in_use_case.dart';
import 'package:reparke/domain/use_cases/auth/sign_up_use_case.dart';
import 'package:reparke/domain/use_cases/auth/verify_reset_pin_use_case.dart';
import 'package:reparke/domain/use_cases/auth/verify_sign_up_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEventSignIn>(_doSignIn);
    on<AuthEventSignUp>(_doSignUp);
    on<AuthEventVerifySignUp>(_verifySign);

    on<AuthEventForgetPin>(_doForgetPin);
    on<AuthEventVerifyResetPin>(_doVerifyResetPin);
    on<AuthEventResetPin>(_doResetPin);
  }

  Future<void> _doVerifyResetPin(AuthEventVerifyResetPin event, Emitter emit) async {
    try {
      emit(AuthStateLoading());
      final AuthEntity? data = await VerifyResetPinUseCase().call(event.data);

      if (data == null) throw Error();
      emit(AuthStateVerifySignUpSuccess());
    } catch (_) {
      emit(AuthStateFailed("Terjadi kesalahan silahkan coba lagi"));
    }
  }

  Future<void> _doResetPin(AuthEventResetPin event, Emitter emit) async {
    try {
      emit(AuthStateLoading());
      final String? data = await NewPinUseCase().call(event.data);

      if (data == null) throw Error();
      emit(AuthStateResetPinSuccess());
    } catch (_) {
      emit(AuthStateFailed("Terjadi kesalahan silahkan coba lagi"));
    }
  }

  Future<void> _doForgetPin(AuthEventForgetPin event, Emitter emit) async {
    try {
      emit(AuthStateLoading());
      final String? data = await SendOTPResetPinUseCase().call(event.data);

      if (data == null) throw Error();
      emit(AuthStateForgetPinSuccess());
    } catch (_) {
      emit(AuthStateFailed("Terjadi kesalahan silahkan coba lagi"));
    }
  }

  Future<void> _doSignIn(AuthEventSignIn event, Emitter emit) async {
    try {
      print("masuk sini");
      emit(AuthStateLoading());
      final UserEntity? currentUser = await GetCurrentUserUseCase().call();

      final AuthEntity? data =  await SignInUseCase().call(event.data.copyWith(
        userId: currentUser!.userId
      ));

      print(data);
      if (data == null) throw Error();

      emit(AuthStateSignInSuccess());

    } on DioException catch (_) {
      emit(AuthStateFailed("Wrong PIN"));
    } catch (_) {
      emit(AuthStateFailed("Terjadi kesalahan silahkan coba lagi"));
    }
  }

  Future<void> _doSignUp(AuthEventSignUp event, Emitter emit) async {
    try {
      emit(AuthStateLoading());
      final res = await SignUpUseCase().call(event.data);
      if (res == null) throw Error();

      emit(AuthStateSingUpSuccess());
    } catch(_) {
      emit(AuthStateFailed("Tidak dapat login silahkan coba lagi."));
    }
  }

  Future<void> _verifySign(AuthEventVerifySignUp event, Emitter emit) async {
    try {
      emit(AuthStateLoading());
      final UserEntity? currentUser = await GetCurrentUserUseCase().call();
      late VerifySignUpPayload data = event.data.copyWith(
        userId: currentUser!.userId
      );
      final res = await VerifySignUpUseCase().call(data);
      if (res == null) throw Error();
      emit(AuthStateVerifySignUpSuccess());
    } catch (_) {
      emit(AuthStateFailed("Terjadi kesalahan silahkan coba lagi"));
    }
  }
}
