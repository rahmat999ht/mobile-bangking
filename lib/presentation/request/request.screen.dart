import 'package:mobile_bangking/app/core/core.dart';
import 'package:mobile_bangking/presentation/request/components/app_bar_request.dart';

import 'controllers/request.controller.dart';

class RequestScreen extends GetView<RequestController> {
  const RequestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarRequest(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Column(
                  children: [
                    TextForm.border(
                      isTitle: true,
                      distance: 7,
                      radius: 16,
                      titel: 'Account number',
                      hintText: 'Number',
                      controller: controller.accountNumberC,
                      isCheck: true,
                    ),
                    12.sizeHeight,
                    TextForm.border(
                      isTitle: true,
                      distance: 7,
                      radius: 16,
                      titel: 'Bank',
                      hintText: 'Select',
                      controller: controller.bankC,
                      isCheck: true,
                      onTap: controller.alertBank,
                    ),
                    12.sizeHeight,
                    TextForm.border(
                      isTitle: true,
                      distance: 7,
                      radius: 16,
                      titel: 'Description',
                      hintText: 'Description',
                      controller: controller.descriptionC,
                      isCheck: true,
                    ),
                    40.sizeHeight,
                    CardAmount(
                      controller: controller.amountC,
                      marginHorizontal: 0,
                    ),
                  ],
                ),
                160.sizeHeight,
                Obx(() {
                  return ButtonPrymary(
                    text: "Request Money",
                    bgColor: AppColor.primary,
                    height: 50,
                    radius: 20,
                    width: Get.width * 0.9,
                    isLoading: controller.isLoading.value,
                    onPressed: controller.send,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
