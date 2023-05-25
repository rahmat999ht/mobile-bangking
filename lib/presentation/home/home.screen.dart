import '../../app/core/core.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHeader(controller.dashboardC.userModel!),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              20.sizeHeight,
              buildBalance(
                controller.dashboardC.userModel!.savings.toString(),
                controller,
              ),
              40.sizeHeight,
              buildServices(controller),
              20.sizeHeight,
              buildTransactionTitle(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildRecentUsers() {
  //   var users = recentUsers.map(
  //     (e) => Padding(
  //       padding: const EdgeInsets.only(right: 15),
  //       child: UserBox(user: e),
  //     ),
  //   );

  //   return SingleChildScrollView(
  //     padding: const EdgeInsets.only(bottom: 5),
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: [...users],
  //     ),
  //   );
  // }

  // Widget _buildTransanctions() {
  //   return Column(
  //     children: List.generate(
  //       5,
  //       (index) => TransactionItem(
  //         e,
  //         idLogin: controller.dashboardC.userModel!.id,
  //       ),
  //     ),
  //   );
  // }
}
