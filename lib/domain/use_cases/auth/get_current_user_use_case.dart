import 'package:reparke/data/repositories/auth_repository_impl.dart';
import 'package:reparke/domain/entities/user_entity.dart';
import 'package:reparke/domain/repositories/auth_repository.dart';
import 'package:reparke/domain/use_cases/use_case.dart';

class GetCurrentUserUseCase extends UseCase<AuthRepository, String> {
  GetCurrentUserUseCase() : super(AuthRepositoryImpl());

  @override
  Future<UserEntity?> call([String? params]) async {
    return await repository.getCurrentUser();
  }
}