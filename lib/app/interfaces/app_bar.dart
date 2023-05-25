import '../core/core.dart';

AppBar appBarCustom(
  leading,
  title,
  trailing, {
  bool isCenter = true,
}) {
  return AppBar(
    backgroundColor: AppColor.appBgColor,
    leading: Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 25,
        left: 20,
      ),
      child: leading,
    ),
    centerTitle: isCenter,
    toolbarHeight: 80,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    title: title,
    actions: [trailing],
  );
}
