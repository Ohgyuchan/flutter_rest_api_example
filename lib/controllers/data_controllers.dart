import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/picture_model.dart';

class DataController extends GetxController {
  static DataController get instance => Get.find();
  var isLast = false.obs;
  final int _limit = 100;

  final pagingController =
      PagingController<int, PictureModel>(firstPageKey: 0).obs;

  @override
  void onInit() {
    pagingController.value.addPageRequestListener((pageKey) {
      fetchApi(pageKey);
    });
    super.onInit();
  }

  fetchApi(int pageKey) async {
    Get.snackbar('PAGE KEY', '${pageKey}');
    var response = await http.get(Uri.parse(
      'https://picsum.photos/v2/list?page=${pageKey}&limit=$_limit',
    ));
    if (response.statusCode == 200) {
      String jsonString = response.body;

      List jsonList = jsonDecode(jsonString);

      final newItems = <PictureModel>[];
      for (var kJson in jsonList) {
        PictureModel pictureToAdd =
            PictureModel(id: kJson["id"], author: kJson["author"]);

        newItems.add(pictureToAdd);
      }

      final isLastPage = newItems.length < _limit;

      if (isLastPage) {
        print(isLastPage.toString());
        isLast.value = isLastPage;
        // pagingController.value.appendLastPage(pictures);
      } else {
        final nextPageKey = pageKey + newItems.length;
        print(nextPageKey);
        pagingController.value.appendPage(newItems, nextPageKey);
      }
    } else {
      print('error');
    }
  }
}
