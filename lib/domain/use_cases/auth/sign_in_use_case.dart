import 'package:reparke/data/payloads/sign_in_payload.dart';
import 'package:reparke/data/repositories/auth_repository_impl.dart';
import 'package:reparke/domain/repositories/auth_repository.dart';
import 'package:reparke/domain/use_cases/use_case.dart';

class SignInUseCase extends UseCase<AuthRepository, SignInPayload> {
  SignInUseCase() : super(AuthRepositoryImpl());

  @override
  Future call([SignInPayload? params]) async {
    return await repository.signIn(payload: params!);
  }
}