import '../../../app/core/core.dart';

class NavBarItem extends GetView<DashboardController> {
  final int index;
  final Color activeColor;
  final Color color;
  final Color bgColor;
  final Color bgActiveColor;
  final IconData icon;
  final bool isClickabel;
  const NavBarItem({
    required this.icon,
    required this.index,
    this.isClickabel = true,
    required this.activeColor,
    required this.color,
    required this.bgColor,
    required this.bgActiveColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => GestureDetector(
            onTap: isClickabel
                ? () {
                    controller.selectedIndex.value = index;
                  }
                : null,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: controller.selectedIndex.value == index
                    ? bgActiveColor
                    : bgColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 25,
                  color: controller.selectedIndex.value == index
                      ? activeColor
                      : color,
                  // color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
