import '../../../app/core/core.dart';

class CardInputAmount extends GetView<SendController> {
  const CardInputAmount({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = controller.dashboardC.userModel!.id;

    return CardAmount(
      controller: controller.amountC,
      onChanged: (v) {
        String value = v.replaceAll(',', '');
        controller.onChanged(value);
      },
      widget: StreamBuilder<DocumentSnapshot<UserModel>>(
        stream: controller.firebaseMethod.getUserByID(userId).snapshots(),
        builder: (context, s) {
          if (s.hasData) {
            return Obx(() {
              final isMines = controller.dashboardC.formatRupiah(
                '${controller.isAmount.value}',
              );
              final user = s.data!.data()!;
              return RichText(
                text: TextSpan(
                  text: 'savings : ',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColor.shadowColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: controller.dashboardC.formatRupiah(
                        '${user.savings}',
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                      ),
                    ),
                    if (controller.isAmount.value != 0)
                      TextSpan(
                        text: ' - $isMines',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.red,
                        ),
                      ),
                  ],
                ),
              );
            });
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}

class CardAmount extends StatelessWidget {
  const CardAmount({
    super.key,
    required this.controller,
    this.onChanged,
    this.widget,
    this.marginHorizontal,
  });

  final TextEditingController controller;
  final void Function(String)? onChanged;
  final Widget? widget;
  final double? marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal ?? 20),
      padding: const EdgeInsets.all(20.0),
      // height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.secondary,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'enter Amount',
                style: TextStyle(
                  color: AppColor.shadowColor,
                ),
              ),
              Text(
                'Change currency?',
                style: TextStyle(
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
          20.sizeHeight,
          Row(
            children: [
              const Text(
                'IDR  ',
                style: TextStyle(
                  color: AppColor.shadowColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              TextForm(
                width: Get.width * 0.6,
                hintText: '5000',
                hintSize: 20,
                textInputType: TextInputType.number,
                controller: controller,
                contentVertical: 11,
                colorBg: AppColor.secondary,
                inputFormatters: [MoneyFormatter()],
                onChanged: onChanged,
              ),
              widget ?? const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
