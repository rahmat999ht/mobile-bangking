import 'package:get/get.dart';

import '../../../../presentation/request/controllers/request.controller.dart';

class RequestControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestController>(
      () => RequestController(),
    );
  }
}
