import 'package:get/get.dart';

import '../../../../presentation/send/controllers/send.controller.dart';

class SendControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendController>(
      () => SendController(),
    );
  }
}
