import '../build_config.dart';

class Constants {
  static const baseUrl = {
    Flavor.production: 'https://google.com',
    Flavor.staging: 'https://google.com',
    Flavor.develop: 'https://fakestoreapi.com/',
  };
}

class ApiConstant {
  static const limitRequestTime = 30;
  static const connectTimeOut = 45;
}