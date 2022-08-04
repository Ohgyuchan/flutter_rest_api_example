import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'constants/route_constant.dart';
import 'constants/get_page_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      title: 'Rest API Using GetX Demo',
      initialRoute: RouteConstant.homePage,
      home: const HomePage(),
    );
  }
}
