import 'package:reparke/domain/repositories/repository.dart';

abstract class UseCase<R extends Repository, Params> {
  final R repository;
  UseCase(this.repository);
  Future call([Params? params]);
}