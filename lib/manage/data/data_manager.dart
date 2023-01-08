import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataManager extends GetxService {
  static const String tokenStringKey = 'TOKEN_STRING_KEY';
  late final GetStorage box;

  Future<DataManager> init() async {
    box = GetStorage();
    return this;
  }

  Future<void> setToken(String token) async {
    await box.write(tokenStringKey, jsonEncode(token));
  }

  Future<String?> getToken() async {
    if (box.read(tokenStringKey) != null) {
      String authEncode = await box.read(tokenStringKey);
      return jsonDecode(authEncode);
    }
    return null;
  }
}