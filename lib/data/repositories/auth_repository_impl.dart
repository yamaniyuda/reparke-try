import 'package:dio/dio.dart';
import 'package:reparke/data/dtos/auth_dto.dart';
import 'package:reparke/data/dtos/user_dto.dart';
import 'package:reparke/data/mappers/auth_mapper.dart';
import 'package:reparke/data/mappers/user_mapper.dart';
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
import 'package:reparke/domain/repositories/auth_repository.dart';
import 'package:reparke/data/data_resources/remote/auth_data_source.dart' as remote;
import 'package:reparke/data/data_resources/local/auth_data_source.dart' as local;
import 'package:reparke/data/data_resources/local/user_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  late UserDataSource localUserDataSource;
  late UserMapper userMapper;

  AuthRepositoryImpl()
    : super(
        mapper: AuthMapper(),
        remoteDataSource: remote.AuthDataSource(),
        localDataSource: local.AuthDataSource()
      ) {
    localUserDataSource = UserDataSource();
    userMapper = UserMapper();
  }

  @override
  Future<String?> sendOTP() async {
    try {
      final UserEntity? currentUser = await getCurrentUser();
      final String data = await remoteDataSource.sendOTP(
        payload: SendOtpPayload(
          type: "email",
          userId: currentUser!.userId
        )
      );
      return data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String?> sendOTPResetPin({required SendOTPResetPinPayload payload}) async {
    try {
      final String data = await remoteDataSource.sendOTPResetPin(payload: payload);
      return data;
    } catch (_) {
      rethrow;
    }
  }



  @override
  Future<AuthEntity?> signIn({required SignInPayload payload}) async {
    try {
      final AuthDTO dataDTO = await remoteDataSource.signIn(payload: payload);
      final AuthEntity dataEntity = mapper.convert<AuthDTO, AuthEntity>(dataDTO);
      await localDataSource.storeAuth(dataDTO);

      return dataEntity;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity?> signUp({required SignUpPayload payload}) async {
    try {
      final UserDTO dataDTO = await remoteDataSource.signUp(payload: payload);
      final UserEntity dataEntity = userMapper.convert<UserDTO, UserEntity>(dataDTO);
      await localUserDataSource.storeUser(dataDTO);
      return dataEntity;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String?> verifySignUp({required VerifySignUpPayload payload}) async {
    try {
      final String response = await remoteDataSource.verifySignUp(payload: payload);
      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String?> resetPin({required ResetPinPayload payload}) async {
    try {
      final String response = await remoteDataSource.resetPin(payload: payload);
      return response;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final UserDTO? userDTO = await localUserDataSource.getUser();
      if (userDTO == null) throw Error();

      final UserEntity userEntity = userMapper.convert<UserDTO, UserEntity>(userDTO);
      return userEntity;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String?> newPin({required NewPinPayload payload}) async {
    try {
      final String data = await remoteDataSource.newPin(payload: payload);
      return data;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<AuthEntity?> verifyResetPin({required VerifyResetPinPayload payload}) async {
    try {
      final AuthDTO dataDTO = await remoteDataSource.verifyResetPin(payload: payload);
      final AuthEntity dataEntity = mapper.convert<AuthDTO, AuthEntity>(dataDTO);
      await localDataSource.storeAuth(dataDTO);
      return dataEntity;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> getToken() async {
    final String token = await localDataSource.getToken();
    return token;
  }
}