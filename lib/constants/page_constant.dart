import 'package:get/get.dart';

import '../bindings/data_binding.dart';
import '../pages/home_page.dart';
import 'route_constant.dart';

List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.homePage,
      page: () => const HomePage(),
      // middlewares: const [
      //   // Add here
      //   // AuthGuard(),
      // ],
      binding: HomePageBinding()),
];
