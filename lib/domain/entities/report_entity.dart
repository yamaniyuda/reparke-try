class ReportEntity {
  late String? id;
  late String? userId;
  late String? reportId;
  late String? tipeKendaraan;
  late String? merekKendaraan;
  late String? alasanLaporan;
  late String? fotoKendaraanUrl;
  late String? lokasiKejadian;
  late String? noPlat;
  late String? warna;
  late String? createdAt;
  late String? detail;

  ReportEntity({
    this.warna,
    this.noPlat,
    this.merekKendaraan,
    this.lokasiKejadian,
    this.detail,
    this.createdAt,
    this.alasanLaporan,
    this.userId,
    this.id,
    this.fotoKendaraanUrl,
    this.reportId,
    this.tipeKendaraan
  });

  ReportEntity copyWith({
    String? id,
    String? userId,
    String? reportId,
    String? tipeKendaraan,
    String? merekKendaraan,
    String? alasanLaporan,
    String? fotoKendaraanUrl,
    String? lokasiKejadian,
    String? noPlat,
    String? warna,
    String? detail,
    String? createdAt
  }) {
    return ReportEntity(
      createdAt: createdAt ?? this.createdAt,
      warna: warna ?? this.warna,
      noPlat: noPlat ?? this.noPlat,
      merekKendaraan: merekKendaraan ?? this.merekKendaraan,
      lokasiKejadian: lokasiKejadian ?? this.lokasiKejadian,
      detail: detail ?? this.detail,
      alasanLaporan: alasanLaporan ?? this.alasanLaporan,
      userId: userId ?? this.userId,
      id: id ?? this.id,
      fotoKendaraanUrl: fotoKendaraanUrl ?? this.fotoKendaraanUrl,
      reportId: reportId ?? this.reportId,
      tipeKendaraan: tipeKendaraan ?? this.tipeKendaraan
    );
  }
}