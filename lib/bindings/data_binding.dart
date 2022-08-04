import 'package:get/get.dart';
import '../controllers/data_controllers.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataController>(() => DataController());
  }
}
