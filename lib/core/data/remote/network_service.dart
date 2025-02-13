import 'package:clean_project/core/data/remote/network_service_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceProvider = Provider<Dio>((ref) {
  final options = BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: Duration(seconds: 60),
    receiveTimeout: Duration(seconds: 10),
    sendTimeout: Duration(seconds: 10),
  );

  final dio = Dio(options);
  final networkServiceInterceptor = ref.watch(networkServiceInterceptorProvider);
  dio.interceptors.addAll(
    [
      HttpFormatter(),
      networkServiceInterceptor,
    ],
  );

  return dio;
});
