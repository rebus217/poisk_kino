import 'package:dio/dio.dart';

import 'poisk_kino_config.dart';

Dio poiskKinoDio() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: PoiskKinoConfig.baseUrl,
      headers: {
        'X-API-KEY': PoiskKinoConfig.apiKey,
        'Content-Type': 'application/json',
      },
    ),
  );

  return dio;
}
