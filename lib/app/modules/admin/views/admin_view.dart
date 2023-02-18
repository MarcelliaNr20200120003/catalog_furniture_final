import 'package:catalog_furniture_final/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminView'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.TAMBAH_CATALOG),
          child: const Icon(
            Icons.add,
            size: 36,
            color: Colors.white,
          )),
      body: const Center(
        child: Text(
          'AdminView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
