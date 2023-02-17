import 'package:get/get.dart';

import '../controllers/tambah_catalog_controller.dart';

class TambahCatalogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahCatalogController>(
      () => TambahCatalogController(),
    );
  }
}
