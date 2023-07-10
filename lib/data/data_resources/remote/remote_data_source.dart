import 'package:reparke/config/api/dio_client.dart';

abstract class RemoteDataSource {
  final DioClient _dioClient;

  RemoteDataSource(): _dioClient = DioClient()..init();
  DioClient get dioClient => _dioClient;
}