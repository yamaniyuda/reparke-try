import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:reparke/data/dtos/report_dto.dart';
import 'package:reparke/domain/entities/report_entity.dart';

part 'report_mapper.g.dart';

@AutoMappr([
  MapType<ReportDTO, ReportEntity>(),
  MapType<ReportEntity, ReportDTO>()
])
class ReportMapper extends $ReportMapper {}