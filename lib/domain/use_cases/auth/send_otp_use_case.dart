import 'package:reparke/data/payloads/send_otp_payload.dart';
import 'package:reparke/data/repositories/auth_repository_impl.dart';
import 'package:reparke/domain/repositories/auth_repository.dart';
import 'package:reparke/domain/use_cases/use_case.dart';

class SendOtpUseCase extends UseCase<AuthRepository, SendOtpPayload> {
  SendOtpUseCase() : super(AuthRepositoryImpl());

  @override
  Future<String?> call([SendOtpPayload? params]) async {
    return await repository.sendOTP();
  }
}