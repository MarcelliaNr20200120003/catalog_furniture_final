import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/controller.controller.dart';

class ControllerScreen extends GetView<ControllerController> {
  const ControllerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ControllerScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ControllerScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
