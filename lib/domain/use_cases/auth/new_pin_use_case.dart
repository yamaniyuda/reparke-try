import 'package:reparke/data/payloads/new_pin_payload.dart';
import 'package:reparke/data/repositories/auth_repository_impl.dart';
import 'package:reparke/domain/repositories/auth_repository.dart';
import 'package:reparke/domain/use_cases/use_case.dart';

class NewPinUseCase extends UseCase<AuthRepository, NewPinPayload> {
  NewPinUseCase() : super(AuthRepositoryImpl());

  @override
  Future<String?> call([NewPinPayload? params]) async {
    return await repository.newPin(payload: params!);
  }
}