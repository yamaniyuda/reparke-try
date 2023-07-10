import 'package:reparke/data/payloads/verify_reset_pin_payload.dart';
import 'package:reparke/data/repositories/auth_repository_impl.dart';
import 'package:reparke/domain/entities/auth_entity.dart';
import 'package:reparke/domain/repositories/auth_repository.dart';
import 'package:reparke/domain/use_cases/use_case.dart';

class VerifyResetPinUseCase extends UseCase<AuthRepository, VerifyResetPinPayload> {
  VerifyResetPinUseCase() : super(AuthRepositoryImpl());

  @override
  Future<AuthEntity?> call([VerifyResetPinPayload? params]) async {
    return await repository.verifyResetPin(payload: params!);
  }
}