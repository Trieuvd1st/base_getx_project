import 'dart:async';
import 'package:base_getx_project/manage/network/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../build_config.dart';
import '../../res/constant.dart';
import 'service/auth_service.dart';
import 'service/store_service.dart';

class Method {
  static const get = 'GET';
  static const post = 'POST';
  static const put = 'PUT';
  static const delete = 'DELETE';
}

BaseOptions _options = BaseOptions(
    baseUrl: Constants.baseUrl[buildConfig.flavor]!,
    connectTimeout: ApiConstant.connectTimeOut * 1000,
    receiveTimeout: ApiConstant.connectTimeOut * 1000,
    headers: {'Content-Type': 'application/json; charset=UTF-8'});

class ApiClient extends getx.GetxService {
  late final Dio dio;
  final authService = AuthService();
  final userService = UserService();
  final storeService = StoreService();

  Future<ApiClient> init() async {
    dio = Dio(_options)
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return this;
  }

  Future<dynamic> request(
    url, {
    String method = Method.get,
    dynamic params,
    dynamic query,
    Map<String, String> headers = const {},
  }) async {
    String? token = "";
    print('Bearer token: $token');
    if (token == null) {
      throw Exception("Token is null");
    }
    try {
      Response response = await dio
          .request(url,
              options: Options(
                method: method,
                headers: {
                  ...headers,
                  'Authorization': token
                },
              ),
              data: params,
              queryParameters: query)
          .timeout(const Duration(seconds: ApiConstant.connectTimeOut));

      dio.close();
      return response.data;
    } on DioError catch (e) {
      if (e.response == null) {
        print("response null");
      }
      if (e.response!.statusCode == 401) {
        print("Unauthorized");
      }
    }
  }
}
