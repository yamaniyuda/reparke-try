import 'package:reparke/data/payloads/report_create_payload.dart';
import 'package:reparke/data/repositories/report_repository_impl.dart';
import 'package:reparke/domain/entities/report_entity.dart';
import 'package:reparke/domain/repositories/report_repository.dart';
import 'package:reparke/domain/use_cases/use_case.dart';

class ReportCreateUseCase extends UseCase<ReportRepository, ReportCreatePayload> {
  ReportCreateUseCase() : super(ReportRepositoryImpl());

  @override
  Future<ReportEntity?> call([ReportCreatePayload? params]) async {
    return await repository.reportCreate(payload: params!);
  }
}