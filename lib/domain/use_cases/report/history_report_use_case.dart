import 'package:reparke/data/repositories/report_repository_impl.dart';
import 'package:reparke/domain/entities/report_entity.dart';
import 'package:reparke/domain/repositories/report_repository.dart';
import 'package:reparke/domain/use_cases/use_case.dart';

class HistoryReportUseCase extends UseCase<ReportRepository, String> {
  HistoryReportUseCase() : super(ReportRepositoryImpl());

  @override
  Future<List<ReportEntity>?> call([String? params]) async {
    return await repository.historyReport();
  }
}