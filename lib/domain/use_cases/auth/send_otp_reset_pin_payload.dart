import 'package:reparke/data/payloads/send_otp_reset_pin_payload.dart';
import 'package:reparke/data/repositories/auth_repository_impl.dart';
import 'package:reparke/domain/repositories/auth_repository.dart';
import 'package:reparke/domain/use_cases/use_case.dart';

class SendOTPResetPinUseCase extends UseCase<AuthRepository, SendOTPResetPinPayload> {
  SendOTPResetPinUseCase() : super(AuthRepositoryImpl());

  @override
  Future<String?> call([SendOTPResetPinPayload? params]) async {
    return await repository.sendOTPResetPin(payload: params!);
  }
}