import '../../app/core/core.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.appBgColor.withOpacity(.95),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Scaffold(
        body: controller.obx(
          (state) => Obx(
            () => controller.widgetOptions.elementAt(
              controller.selectedIndex.value,
            ),
          ),
          onLoading: const LoadingState(),
          onEmpty: const EmptyState(),
          onError: (e) => ErrorState(error: e!),
        ),
        bottomNavigationBar: const BottomBar(),
        // resizeToAvoidBottomInset: false,
      ),
    );
  }
}
