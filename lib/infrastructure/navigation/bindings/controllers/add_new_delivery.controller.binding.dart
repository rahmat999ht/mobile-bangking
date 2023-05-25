import 'package:get/get.dart';

import '../../../../presentation/add_new_delivery/controllers/add_new_delivery.controller.dart';

class AddNewDeliveryControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewDeliveryController>(
      () => AddNewDeliveryController(),
    );
  }
}
