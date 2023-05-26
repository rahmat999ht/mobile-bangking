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
                () => toUserName(
                  state,
                  controller.counter.value,
                ),
              ),
              20.sizeHeight,
              const CardInputAmount(),
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
                final isCounter = state[controller.counter.value];
                final user = controller.listUser.firstWhere(
                  (e) => e.id == isCounter.toUser?.id,
                );
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
