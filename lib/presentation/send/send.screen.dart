import 'package:mobile_bangking/presentation/send/components/card_amount.dart';
import 'package:mobile_bangking/presentation/send/components/card_banking.dart';
import 'package:mobile_bangking/presentation/send/components/swiper.dart';
import 'package:mobile_bangking/presentation/send/components/to_user.dart';
import 'package:packages/button/button_outline.dart';

import '../../app/core/core.dart';

class SendScreen extends GetView<SendController> {
  const SendScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: controller.obx(
        (state) => SingleChildScrollView(
          child: Column(
            children: [
              20.sizeHeight,
              CardBanking(state!),
              30.sizeHeight,
              ListSwiper(state),
              10.sizeHeight,
              Obx(
                () => toUser(
                  state,
                  controller.counter.value,
                ),
              ),
              20.sizeHeight,
              cardInputAmount(
                controller.amountC,
                controller.dashboardC,
              ),
              20.sizeHeight,
              ButtonOutline(
                text: 'Add new Delivery',
                height: 50,
                radius: 20,
                colorBorder: AppColor.primary,
                fontColor: AppColor.primary,
                width: Get.width * 0.9,
                onPressed: controller.toNewDelivery,
              ),
              20.sizeHeight,
              Obx(() {
                final user = controller.listUser[controller.counter.value];
                return ButtonPrymary(
                  text: "Send Money",
                  bgColor: AppColor.primary,
                  height: 50,
                  radius: 20,
                  width: Get.width * 0.9,
                  isLoading: controller.isLoading.value,
                  onPressed: () {
                    controller.send(user.id);
                    // controller.add();
                  },
                );
              }),
              20.sizeHeight,
            ],
          ),
        ),
        onEmpty: const EmptyState(),
        onLoading: const LoadingState(),
        onError: (e) => ErrorState(error: e!),
      ),
    );
  }
}
