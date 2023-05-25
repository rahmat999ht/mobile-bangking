import '../../../app/core/core.dart';

class BottomBar extends GetView<DashboardController> {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.bottomBarColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              blurRadius: 3.5,
              spreadRadius: 3.5,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Row(
          children: [
            const Spacer(
              flex: 3,
            ),
            NavBarItem(
              isClickabel: controller.isLoading.value,
              activeColor: AppColor.mainColor,
              color: AppColor.shadowColor,
              bgColor: AppColor.secondary,
              bgActiveColor: AppColor.bgActiv,
              index: 0,
              icon: Icons.home,
            ),
            const Spacer(
              flex: 4,
            ),
            NavBarItem(
              isClickabel: controller.isLoading.value,
              activeColor: AppColor.mainColor,
              color: AppColor.shadowColor,
              bgColor: AppColor.secondary,
              bgActiveColor: AppColor.bgActiv,
              index: 1,
              icon: Icons.person,
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
