// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportDTO _$ReportDTOFromJson(Map<String, dynamic> json) => ReportDTO(
      tipeKendaraan: json['tipe_kendaraan'] as String?,
      reportId: json['report_id'] as String?,
      fotoKendaraanUrl: json['foto_kendaraan_url'] as String?,
      id: json['_id'] as String?,
      userId: json['user_id'] as String?,
      alasanLaporan: json['alasan_laporan'] as String?,
      detail: json['detail'] as String?,
      lokasiKejadian: json['lokasi_kejadian'] as String?,
      merekKendaraan: json['merek_kendaraan'] as String?,
      noPlat: json['no_plat'] as String?,
      createdAt: json['createdAt'] as String?,
      warna: json['warna'] as String?,
    );

Map<String, dynamic> _$ReportDTOToJson(ReportDTO instance) => <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'report_id': instance.reportId,
      'tipe_kendaraan': instance.tipeKendaraan,
      'merek_kendaraan': instance.merekKendaraan,
      'alasan_laporan': instance.alasanLaporan,
      'foto_kendaraan_url': instance.fotoKendaraanUrl,
      'lokasi_kejadian': instance.lokasiKejadian,
      'no_plat': instance.noPlat,
      'warna': instance.warna,
      'detail': instance.detail,
      'createdAt': instance.createdAt,
    };
