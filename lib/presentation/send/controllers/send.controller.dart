import 'dart:developer';

import '../../../app/core/core.dart';

class SendController extends GetxController
    with StateMixin<List<TransaksiModel>> {
  final List<UserModel> listUser = Get.find<HomeController>().listUser;
  final dashboardC = Get.find<DashboardController>();
  final transaksiC = Get.find<TransaksiController>();
  final firebaseMethod = FirebaseMethod();

  final counter = 0.obs;
  final amountC = TextEditingController();
  final isLoading = false.obs;

  List<TransaksiModel> listTransaksiUserLogin = [];

  void loadingState() {
    isLoading.value = !isLoading.value;
  }

  void toNewDelivery() {
    Get.toNamed(Routes.ADD_NEW_DELIVERY);
  }

  void add() {
    final userLogin = firebaseMethod.getUserByID(dashboardC.userModel!.id);
    final toUser = firebaseMethod.getUserByID('z43TAQxUOPHwCGrnSqs1');

    firebaseMethod.addTransaction(
      data: TransaksiModel(
        userLogin: userLogin,
        toUser: toUser,
        amount: 100000,
        uploadDate: Timestamp.now(),
      ).toMap(),
    );
  }

  void send(String idUser) {
    log('mulai');
    try {
      final userLogin = firebaseMethod.getUserByID(dashboardC.userModel!.id);
      final toUser = firebaseMethod.getUserByID(idUser);
      if (amountC.text != '') {
        log('lolos');
        loadingState();
        log(amountC.text);
        final String amount = amountC.text.replaceAll(',', '');
        final int fixAmount = int.parse(amount);
        log(amount);
        firebaseMethod.addTransaction(
          data: TransaksiModel(
            userLogin: userLogin,
            toUser: toUser,
            amount: fixAmount,
            uploadDate: Timestamp.now(),
          ).toMap(),
        );
        firebaseMethod.addTransaction(
          data: TransaksiModel(
            userLogin: userLogin,
            toUser: toUser,
            amount: fixAmount,
            uploadDate: Timestamp.now(),
          ).toMap(),
        );
        final UserModel user = dashboardC.userModel!;
        final int fixSavings = user.savings! - fixAmount;
        firebaseMethod.updateUser(
          id: user.id,
          data: {
            'savings': fixSavings,
          },
        );
        Get.offAllNamed(Routes.DASHBOARD);
        loadingState();
        log('selesai');
      } else {
        Get.snackbar(
          'Info',
          "Fill in the nominal amount of money to be sent",
        );
      }
    } catch (e) {
      Get.snackbar(
        'Info',
        "Pesan error $e",
      );
    }
  }

  @override
  void onInit() {
    final listTransaksiUserLogin = transaksiC.listTransaksiUserLogin;
    if (listTransaksiUserLogin.isNotEmpty) {
      change(listTransaksiUserLogin, status: RxStatus.success());
    } else {
      change([], status: RxStatus.empty());
    }
    super.onInit();
  }
}
