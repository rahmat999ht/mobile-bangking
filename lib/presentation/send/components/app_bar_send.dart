import '../../../app/core/core.dart';

appBar() {
  return appBarCustom(
    const IconCustom(),
    const Text(
      "Send Money",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColor.primary,
      ),
    ),
    const SizedBox(),
  );
}
