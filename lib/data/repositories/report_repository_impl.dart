import 'package:reparke/data/data_resources/remote/report_data_source.dart';
import 'package:reparke/data/dtos/report_dto.dart';
import 'package:reparke/data/mappers/report_mapper.dart';
import 'package:reparke/data/payloads/report_create_payload.dart';
import 'package:reparke/domain/entities/report_entity.dart';
import 'package:reparke/domain/repositories/report_repository.dart';

class ReportRepositoryImpl extends ReportRepository {
  ReportRepositoryImpl()
    : super(
      remoteDataSource: ReportDataSource(),
      mapper: ReportMapper()
    );

  @override
  Future<List<ReportEntity>> historyReport() async {
    try {
      final List<ReportDTO> dataDTO = await remoteDataSource.getReportHistory();
      final List<ReportEntity> dataEntity = List<ReportEntity>.from(
        dataDTO.map((dto) => mapper.convert<ReportDTO, ReportEntity>(dto))
      );

      return dataEntity;
    } catch(_) {
      rethrow;
    }
  }

  @override
  Future<ReportEntity> reportCreate({required ReportCreatePayload payload}) async {
    try {
      final ReportDTO dataDTO = await remoteDataSource.createReport(payload: payload);
      final ReportEntity dataEntity = mapper.convert<ReportDTO, ReportEntity>(dataDTO);

      return dataEntity;
    } catch(_) {
      rethrow;
    }
  }

}