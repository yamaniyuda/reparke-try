import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:reparke/data/payloads/report_create_payload.dart';
import 'package:reparke/domain/entities/report_entity.dart';
import 'package:reparke/domain/use_cases/report/history_report_use_case.dart';
import 'package:reparke/domain/use_cases/report/report_create_use_case.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportInitial()) {
    on<ReportEventCreate>(_doCreateReport);
    on<ReportEventGet>(_doGetReport);
  }

  Future<void> _doGetReport(ReportEventGet event, Emitter emit) async {
    try {
      emit(ReportStateLoading());
      final List<ReportEntity>? data = await HistoryReportUseCase().call();

      if (data == null) throw Error();
      emit(ReportStateGet(data));
    } on DioException catch(e) {
      emit(ReportStateFailed(e.response!.data["message"]));
    } catch (e) {
      emit(ReportStateFailed("Proses data gagal silahkan coba lagi."));
    }
  }

  Future<void> _doCreateReport(ReportEventCreate event, Emitter emit) async {
    try {
      emit(ReportStateLoading());
      final ReportEntity? data = await ReportCreateUseCase().call(event.data);

      if (data == null) throw Error();
      emit(ReportStateSuccess());
    } on DioException catch(e) {
      emit(ReportStateFailed(e.response!.data["message"]));
    } catch (e) {
      emit(ReportStateFailed("Proses data gagal silahkan coba lagi."));
    }
  }
}
