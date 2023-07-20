import 'package:dio/dio.dart';
import 'package:reparke/data/data_resources/remote/remote_data_source.dart';
import 'package:reparke/data/dtos/report_dto.dart';
import 'package:reparke/data/payloads/report_create_payload.dart';
import 'package:reparke/helpers/helper.dart';

class ReportDataSource extends RemoteDataSource {
  Future<ReportDTO> createReport({ required ReportCreatePayload payload }) async {
    late Map<String, dynamic> postDataParams = payload.toJson();
    final FormData formData = FormData.fromMap({
      // "image": await MultipartFile.fromFile(payload.image!.path, filename: payload.image!.name)
    });

    postDataParams.remove("image");
    final ReportDTO response = await dioClient.postRequest(
        "report?${Helper().mapToString("&", postDataParams)}",
        data: formData,
        converter: (data) => ReportDTO.fromJson(data["data"])
    );

    return response;
  }

  Future<List<ReportDTO>> getReportHistory() async {
    final List<ReportDTO> response = await dioClient.getRequest(
      "report",
      converter: (data) => List<ReportDTO>.from(
        data["data"].map((x) => ReportDTO.fromJson(x))
      )
    );

    return response;
  }
}