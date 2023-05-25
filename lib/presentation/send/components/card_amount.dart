import '../../../app/core/core.dart';

Container cardInputAmount(
  TextEditingController controller,
  DashboardController dashboardC,
) {
  final savings = dashboardC.userModel!.savings;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
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
              isCheck: true,
              inputFormatters: [MoneyFormatter()],
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            text: 'savings : ',
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: AppColor.shadowColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: dashboardC.formatRupiah('$savings'),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
