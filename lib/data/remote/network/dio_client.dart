// ignore_for_file: unused_catch_clause, avoid_print

import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  static Dio get instance {
    // Add interceptors for logging and retry
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('🚀 ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('✅ ${response.statusCode} ${response.requestOptions.uri}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print('❌ ${e.type} ${e.message}');
          return handler.next(e);
        },
      ),
    );

    return _dio;
  }

  // Optional: Add retry functionality
  static Future<Response> getWithRetry(
    String path, {
    Map<String, dynamic>? queryParameters,
    int maxRetries = 2,
  }) async {
    for (int i = 0; i <= maxRetries; i++) {
      try {
        return await instance.get(path, queryParameters: queryParameters);
      } on DioException catch (e) {
        if (i == maxRetries) rethrow;
        await Future.delayed(Duration(seconds: 1 * (i + 1)));
      }
    }
    throw Exception('Failed after $maxRetries retries');
  }
}
