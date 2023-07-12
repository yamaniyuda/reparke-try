

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:reparke/data/dtos/dto.dart';

part 'report_dto.g.dart';

@JsonSerializable()
class ReportDTO implements DTO {
  @JsonKey(name: "_id")
  late String? id;

  @JsonKey(name: "user_id")
  late String? userId;

  @JsonKey(name: "report_id")
  late String? reportId;

  @JsonKey(name: "tipe_kendaraan")
  late String? tipeKendaraan;

  @JsonKey(name: "merek_kendaraan")
  late String? merekKendaraan;

  @JsonKey(name: "alasan_laporan")
  late String? alasanLaporan;

  @JsonKey(name: "foto_kendaraan_url")
  late String? fotoKendaraanUrl;

  @JsonKey(name: "lokasi_kejadian")
  late String? lokasiKejadian;

  @JsonKey(name: "no_plat")
  late String? noPlat;

  @JsonKey(name: "warna")
  late String? warna;

  @JsonKey(name: "detail")
  late String? detail;

  @JsonKey(name: "createdAt")
  late String? createdAt;

  ReportDTO({
    this.tipeKendaraan,
    this.reportId,
    this.fotoKendaraanUrl,
    this.id,
    this.userId,
    this.alasanLaporan,
    this.detail,
    this.lokasiKejadian,
    this.merekKendaraan,
    this.noPlat,
    this.createdAt,
    this.warna,
  });

  factory ReportDTO.fromJson(Map<String, dynamic> json) {
    return _$ReportDTOFromJson(json);
  }

  factory ReportDTO.deserialize(String json) {
    return ReportDTO.fromJson(jsonDecode(json));
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ReportDTOToJson(this);
  }

  String serialize() {
    return jsonEncode(toJson());
  }
}