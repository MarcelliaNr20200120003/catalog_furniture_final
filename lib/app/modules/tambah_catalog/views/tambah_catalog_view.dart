import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_catalog_controller.dart';

class TambahCatalogView extends GetView<TambahCatalogController> {
  const TambahCatalogView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TambahCatalogView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TambahCatalogView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
