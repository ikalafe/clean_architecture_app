import 'package:clean_project/core/data/local/secure_storage/flutter_secure_storage_const.dart';
import 'package:clean_project/core/data/local/secure_storage/isecure_storage.dart';
import 'package:clean_project/core/data/local/secure_storage/secure_storage_imp.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceInterceptorProvider =
    Provider<NetworkServiceInterceptor>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);

  return NetworkServiceInterceptor(secureStorage);
});

final class NetworkServiceInterceptor extends Interceptor {
  final ISecureStorage _secureStorage;

  NetworkServiceInterceptor(this._secureStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _secureStorage.read(accessTokenKey);

    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers['Authorization'] = 'Bearer $accessToken';

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
