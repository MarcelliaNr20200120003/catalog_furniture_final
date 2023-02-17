import 'package:get/get.dart';

import 'package:catalog_furniture_final/app/controller/controllers/auth_controller_controller.dart';

import '../../../../presentation/controller/controllers/controller.controller.dart';

class ControllerControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthControllerController>(
      () => AuthControllerController(),
    );
    Get.lazyPut<ControllerController>(
      () => ControllerController(),
    );
  }
}
