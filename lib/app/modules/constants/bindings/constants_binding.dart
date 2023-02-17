import 'package:get/get.dart';

import '../controllers/constants_controller.dart';

class ConstantsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConstantsController>(
      () => ConstantsController(),
    );
  }
}
