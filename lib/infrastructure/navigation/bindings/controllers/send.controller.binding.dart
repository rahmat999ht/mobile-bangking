import '../../../../app/core/core.dart';

class SendControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendController>(
      () => SendController(),
    );
  }
}
