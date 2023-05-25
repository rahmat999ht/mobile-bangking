import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/add_new_delivery.controller.dart';

class AddNewDeliveryScreen extends GetView<AddNewDeliveryController> {
  const AddNewDeliveryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddNewDeliveryScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddNewDeliveryScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
