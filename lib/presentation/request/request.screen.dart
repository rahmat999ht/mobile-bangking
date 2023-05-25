import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/request.controller.dart';

class RequestScreen extends GetView<RequestController> {
  const RequestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RequestScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RequestScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
