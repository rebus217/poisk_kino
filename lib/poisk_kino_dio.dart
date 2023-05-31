import 'package:dio/dio.dart';

import 'constants.dart';

Dio poiskKinoDio() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'X-API-KEY': apiKey,
        'Content-Type': 'application/json',
      },
    ),
  );

  return dio;
}
