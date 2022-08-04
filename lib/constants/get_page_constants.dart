import 'package:flutter_rest_api_example/bindings/home_page_binding.dart';
import 'package:flutter_rest_api_example/screens/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'route_constant.dart';

List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.homePage,
      page: () => const HomePage(),
      middlewares: const [
        // Add here
        // AuthGuard(),
      ],
      binding: HomePageBinding()),
];
