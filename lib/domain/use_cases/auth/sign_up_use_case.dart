import 'package:reparke/data/payloads/sign_up_payload.dart';
import 'package:reparke/data/repositories/auth_repository_impl.dart';
import 'package:reparke/domain/entities/user_entity.dart';
import 'package:reparke/domain/repositories/auth_repository.dart';
import 'package:reparke/domain/use_cases/use_case.dart';

class SignUpUseCase extends UseCase<AuthRepository, SignUpPayload> {
  SignUpUseCase() : super(AuthRepositoryImpl());

  @override
  Future<UserEntity?> call([SignUpPayload? params]) {
    return repository.signUp(payload: params!);
  }
}