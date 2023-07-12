// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_mapper.dart';

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: require_trailing_commas, unnecessary_const
// ignore_for_file: unnecessary_lambdas, unnecessary_parenthesis
// ignore_for_file: unnecessary_raw_strings

/// {@template package:reparke/data/mappers/report_mapper.dart}
/// Available mappings:
/// - `ReportDTO` → `ReportEntity`.
/// - `ReportEntity` → `ReportDTO`.
/// {@endtemplate}
class $ReportMapper implements AutoMapprInterface {
  const $ReportMapper();

  Type _typeOf<T>() => T;
  List<AutoMapprInterface> get _modules => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:reparke/data/mappers/report_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<ReportDTO>() ||
            sourceTypeOf == _typeOf<ReportDTO?>()) &&
        (targetTypeOf == _typeOf<ReportEntity>() ||
            targetTypeOf == _typeOf<ReportEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<ReportEntity>() ||
            sourceTypeOf == _typeOf<ReportEntity?>()) &&
        (targetTypeOf == _typeOf<ReportDTO>() ||
            targetTypeOf == _typeOf<ReportDTO?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _modules) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:reparke/data/mappers/report_mapper.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:reparke/data/mappers/report_mapper.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(model);
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:reparke/data/mappers/report_mapper.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:reparke/data/mappers/report_mapper.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
      Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>((item) => _convert(item, canReturnNull: true));
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:reparke/data/mappers/report_mapper.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:reparke/data/mappers/report_mapper.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:reparke/data/mappers/report_mapper.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:reparke/data/mappers/report_mapper.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _modules) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<ReportDTO>() ||
            sourceTypeOf == _typeOf<ReportDTO?>()) &&
        (targetTypeOf == _typeOf<ReportEntity>() ||
            targetTypeOf == _typeOf<ReportEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__ReportDTO__To__ReportEntity((model as ReportDTO?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<ReportEntity>() ||
            sourceTypeOf == _typeOf<ReportEntity?>()) &&
        (targetTypeOf == _typeOf<ReportDTO>() ||
            targetTypeOf == _typeOf<ReportDTO?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__ReportEntity__To__ReportDTO((model as ReportEntity?))
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  ReportEntity _map__ReportDTO__To__ReportEntity(ReportDTO? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ReportDTO → ReportEntity failed because ReportDTO was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ReportDTO, ReportEntity> to handle null values during mapping.');
    }
    return ReportEntity(
      warna: model.warna,
      noPlat: model.noPlat,
      merekKendaraan: model.merekKendaraan,
      lokasiKejadian: model.lokasiKejadian,
      detail: model.detail,
      createdAt: model.createdAt,
      alasanLaporan: model.alasanLaporan,
      userId: model.userId,
      id: model.id,
      fotoKendaraanUrl: model.fotoKendaraanUrl,
      reportId: model.reportId,
      tipeKendaraan: model.tipeKendaraan,
    );
  }

  ReportDTO _map__ReportEntity__To__ReportDTO(ReportEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ReportEntity → ReportDTO failed because ReportEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ReportEntity, ReportDTO> to handle null values during mapping.');
    }
    return ReportDTO(
      tipeKendaraan: model.tipeKendaraan,
      reportId: model.reportId,
      fotoKendaraanUrl: model.fotoKendaraanUrl,
      id: model.id,
      userId: model.userId,
      alasanLaporan: model.alasanLaporan,
      detail: model.detail,
      lokasiKejadian: model.lokasiKejadian,
      merekKendaraan: model.merekKendaraan,
      noPlat: model.noPlat,
      createdAt: model.createdAt,
      warna: model.warna,
    );
  }
}
