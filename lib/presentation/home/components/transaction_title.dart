import '../../../app/core/core.dart';

class TransactionTitle extends GetView<TransaksiController> {
  const TransactionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Transactions",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: controller.alertFilter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Text(
                      controller.valueFilter.value,
                      style: TextStyle(
                        fontSize: 16,
                        color: controller.valueFilter.value == 'ToDay'
                            ? AppColor.appBgColorPrimary
                            : AppColor.red,
                      ),
                    ),
                  ),
                  const Icon(Icons.expand_more_rounded),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
