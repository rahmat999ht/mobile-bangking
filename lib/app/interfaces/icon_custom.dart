import '../core/core.dart';

class IconCustom extends StatelessWidget {
  const IconCustom({
    super.key,
    this.onTap,
    this.icon,
  });
  final void Function()? onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? Get.back,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColor.secondary,
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          border: Border.all(),
        ),
        child: Center(
          child: Icon(
            icon ?? Icons.arrow_back,
            color: AppColor.primary,
          ),
        ),
      ),
    );
  }
}
