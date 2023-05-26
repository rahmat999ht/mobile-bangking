import '../../../app/core/core.dart';

appBarRequest() {
  return appBarCustom(
    const IconCustom(),
    const Text(
      "Request Money",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColor.primary,
      ),
    ),
    const SizedBox(),
  );
}
