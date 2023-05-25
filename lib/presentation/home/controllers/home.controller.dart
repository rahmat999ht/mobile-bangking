import '../../../app/core/core.dart';

class HomeController extends GetxController with StateMixin<List<UserModel>> {
  final dashboardC = Get.find<DashboardController>();
  // final listTransaksi = Get.find<SendController>().listTransaksi;
  List<UserModel> listUser = <UserModel>[];
  final firebaseMethod = FirebaseMethod();

  void toSend() {
    Get.toNamed(Routes.SEND);
  }

  void toRequest() {
    Get.toNamed(Routes.REQUEST);
  }

  @override
  void onInit() async {
    final dataAllUser = firebaseMethod.getUser().snapshots();
    dataAllUser.listen((event) {
      if (event.size != 0) {
        listUser = List.generate(
          event.docs.length,
          (index) => UserModel.fromDocumentSnapshot(event.docs[index]),
        );
        change(listUser, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    });

    super.onInit();
  }
}
