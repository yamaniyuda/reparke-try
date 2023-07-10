import 'package:reparke/data/repositories/auth_repository_impl.dart';
import 'package:reparke/domain/repositories/auth_repository.dart';
import 'package:reparke/domain/use_cases/use_case.dart';

class GetTokenUseCase extends UseCase<AuthRepository, String> {
  GetTokenUseCase() : super(AuthRepositoryImpl());

  @override
  Future call([String? params]) {
    return repository.getToken();
  }
}