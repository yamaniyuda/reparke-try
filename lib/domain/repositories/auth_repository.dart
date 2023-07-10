import 'package:reparke/data/data_resources/remote/auth_data_source.dart' as remote;
import 'package:reparke/data/data_resources/local/auth_data_source.dart' as local;
import 'package:reparke/data/dtos/auth_dto.dart';
import 'package:reparke/data/mappers/auth_mapper.dart';
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
import 'package:reparke/domain/repositories/repository.dart';

abstract class AuthRepository extends Repository {
  final remote.AuthDataSource remoteDataSource;
  final local.AuthDataSource localDataSource;
  final AuthMapper mapper;

  AuthRepository({
    required this.mapper,
    required this.localDataSource,
    required this.remoteDataSource
  });

  Future<UserEntity?> signUp({ required SignUpPayload payload });
  Future<String?> verifySignUp({ required VerifySignUpPayload payload });
  Future<String?> sendOTP();
  Future<AuthEntity?> signIn({ required SignInPayload payload });
  Future<String?> resetPin({ required ResetPinPayload payload });
  Future<UserEntity?> getCurrentUser();
  Future<String> getToken();
  Future<String?> sendOTPResetPin({ required SendOTPResetPinPayload payload });
  Future<AuthEntity?> verifyResetPin({ required VerifyResetPinPayload payload });
  Future<String?> newPin({ required NewPinPayload payload });
}