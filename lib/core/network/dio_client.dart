// lib/core/network/dio_client.dart
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient({required String baseUrl})
      : dio = Dio(
          BaseOptions(baseUrl: baseUrl, headers: {"Content-Type": "application/json"}),
        );
}
