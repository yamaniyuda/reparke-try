part of 'report_bloc.dart';

@immutable
abstract class ReportEvent {}

class ReportEventCreate extends ReportEvent {
  final ReportCreatePayload data;
  ReportEventCreate(this.data);
}

class ReportEventGet extends ReportEvent {}