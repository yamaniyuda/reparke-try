import 'package:reparke/data/data_resources/remote/report_data_source.dart' as remote;
import 'package:reparke/data/mappers/report_mapper.dart';
import 'package:reparke/data/payloads/report_create_payload.dart';
import 'package:reparke/domain/entities/report_entity.dart';
import 'package:reparke/domain/repositories/repository.dart';

abstract class ReportRepository extends Repository {
  final remote.ReportDataSource remoteDataSource;
  final ReportMapper mapper;

  ReportRepository({
    required this.mapper,
    required this.remoteDataSource
  });

  Future<ReportEntity> reportCreate({ required ReportCreatePayload payload });
  Future<List<ReportEntity>> historyReport();
}