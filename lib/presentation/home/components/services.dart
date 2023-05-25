import '../../../app/core/core.dart';

buildServices(HomeController c) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        child: GestureDetector(
          onTap: c.toSend,
          child: const ServiceBox(
            title: "Send",
            icon: Icons.send_rounded,
            bgColor: AppColor.green,
          ),
        ),
      ),
      15.sizeWidth,
      Expanded(
        child: GestureDetector(
          onTap: c.toRequest,
          child: const ServiceBox(
            title: "Request",
            icon: Icons.arrow_circle_down_rounded,
            bgColor: AppColor.yellow,
          ),
        ),
      ),
      15.sizeWidth,
      Expanded(
        child: GestureDetector(
          onTap: () {},
          child: const ServiceBox(
            title: "More",
            icon: Icons.widgets_rounded,
            bgColor: AppColor.purple,
          ),
        ),
      ),
    ],
  );
}
