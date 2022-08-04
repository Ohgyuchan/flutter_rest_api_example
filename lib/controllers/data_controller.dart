import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  UserModel? userModel;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('http://dummyapi.io/data/v1/user')!,
          headers: {'app-id': '6218809df11d1d412af5bac4'});
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        userModel = UserModel.fromJson(result);
      } else {
        // error
        Get.snackbar('실패!', '실패다!');
      }
    } catch (e) {
      log('Error while getting data is $e');
      if (kDebugMode) {
        print('Error while getting data is $e');
      }
    } finally {
      isDataLoading(false);
    }
  }
}