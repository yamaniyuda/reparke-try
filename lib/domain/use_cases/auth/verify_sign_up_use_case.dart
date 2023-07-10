import 'package:reparke/data/payloads/verify_sign_up_payload.dart';
import 'package:reparke/data/repositories/auth_repository_impl.dart';
import 'package:reparke/domain/repositories/auth_repository.dart';
import 'package:reparke/domain/use_cases/use_case.dart';

class VerifySignUpUseCase extends UseCase<AuthRepository, VerifySignUpPayload> {
  VerifySignUpUseCase() : super(AuthRepositoryImpl());

  @override
  Future<String?> call([VerifySignUpPayload? params]) async {
    final String? response = await repository.verifySignUp(payload: params!);
    return response;
  }
}