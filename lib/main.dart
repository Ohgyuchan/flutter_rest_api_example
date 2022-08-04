import 'package:flutter_rest_api_example/bindings/data_binding.dart';
import 'package:flutter_rest_api_example/constants/page_constant.dart';
import 'package:flutter_rest_api_example/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'constants/route_constant.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData.dark(),
      getPages: getPages,
      initialBinding: HomePageBinding(),
      initialRoute: RouteConstant.homePage,
    ),
  );
}
