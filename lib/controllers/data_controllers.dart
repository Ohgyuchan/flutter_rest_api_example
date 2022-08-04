import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/picture_model.dart';

class DataController extends GetxController {
  static DataController get instance => Get.find();
  var page = 1.obs;
  int limit = 20;
  var pictures = <PictureModel>[].obs;

  fetchApi() async {
    var response = await http.get(Uri.parse(
      'https://picsum.photos/v2/list?page=${page.value}&limit=$limit',
    ));
    if (response.statusCode == 200) {
      String jsonString = response.body;
      print(jsonString);

      List jsonList = jsonDecode(jsonString);

      for (var kJson in jsonList) {
        PictureModel pictureToAdd =
            PictureModel(id: kJson["id"], author: kJson["author"]);
        print(pictureToAdd.author);

        pictures.add(pictureToAdd);
        page.value++;
      }
    } else {
      print('error');
    }
  }
}
