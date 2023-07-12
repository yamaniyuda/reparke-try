import 'package:image_picker/image_picker.dart';
import 'package:reparke/data/payloads/payload.dart';

class ReportCreatePayload extends Payload {
  final String? tipeKendaraan;
  final String? merekKendaraan;
  final String? alasanLaporan;
  final String? lokasiKejadian;
  final String? noPlat;
  final String? warna;
  final String? detail;
  final XFile? image;

  ReportCreatePayload({
    this.tipeKendaraan,
    this.alasanLaporan,
    this.detail,
    this.lokasiKejadian,
    this.merekKendaraan,
    this.noPlat,
    this.image,
    this.warna,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "tipe_kendaraan": tipeKendaraan,
      "merek_kendaraan": merekKendaraan,
      "alasan_laporan": alasanLaporan,
      "lokasi_kejadian": lokasiKejadian,
      "no_plat": noPlat,
      "warna": warna,
      "detail": detail,
      "image": image
    };
  }

  ReportCreatePayload copyWith({
    String? tipeKendaraan,
    String? merekKendaraan,
    String? alasanLaporan,
    String? lokasiKejadian,
    String? noPlat,
    String? warna,
    String? detail,
    XFile? image
  }) {
    return ReportCreatePayload(
      tipeKendaraan: tipeKendaraan ?? this.tipeKendaraan,
      alasanLaporan: alasanLaporan ?? this.alasanLaporan,
      detail: detail ?? this.detail,
      lokasiKejadian: lokasiKejadian ?? this.lokasiKejadian,
      merekKendaraan: merekKendaraan ?? this.merekKendaraan,
      noPlat: noPlat ?? this.noPlat,
      warna: warna ?? this.warna,
      image: image ?? this.image
    );
  }
}