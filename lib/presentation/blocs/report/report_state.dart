part of 'report_bloc.dart';

@immutable
abstract class ReportState {}

class ReportInitial extends ReportState {}

class ReportStateLoading extends ReportState {}

class ReportStateFailed extends ReportState {
  final String e;
  ReportStateFailed(this.e);
}

/// begin:: report create
class ReportStateCreate extends ReportState {}
/// end:: report create


/// begin:: get report
class ReportStateGet extends ReportState {
  List<ReportEntity> data;
  ReportStateGet(this.data);
}
/// end:: get report

class ReportStateSuccess extends ReportState {}
