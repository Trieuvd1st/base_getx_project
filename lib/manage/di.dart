import 'package:base_getx_project/manage/data/data_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'network/api_client.dart';

Future<void> injectDependencies() async {
  Get.putAsync(() => ApiClient().init());
  Get.putAsync(() => DataManager().init());
}

ApiClient get api => Get.find<ApiClient>();
Dio get dio => api.dio;
DataManager get dataManager => Get.find<DataManager>();