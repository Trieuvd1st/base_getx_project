import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../build_config.dart';
import '../res/constant.dart';

Future<Dio> provideDio() async {
  return Dio(_options)
    ..interceptors.addAll([
      if (kDebugMode)
        LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          request: true,
          error: true,
        ),
      //AuthInterceptor()
    ]);
}

BaseOptions _options = BaseOptions(
  baseUrl: Constants.baseUrl[buildConfig.flavor]!,
  connectTimeout: 10000,
  receiveTimeout: 30000,
);
