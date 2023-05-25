import 'dart:developer';

import '../../../app/core/core.dart';

class SendController extends GetxController
    with StateMixin<List<TransaksiModel>> {
  final List<UserModel> listUser = Get.find<HomeController>().listUser;
  final dashboardC = Get.find<DashboardController>();
  final firebaseMethod = FirebaseMethod();

  final counter = 0.obs;
  final amountC = TextEditingController();
  final valueButton = ''.obs;
  final isLoading = false.obs;

  List<TransaksiModel> listTransaksi = [];

  void loadingState() {
    isLoading.value = !isLoading.value;
  }

  String day(int isDay) {
    String value = '';
    if (isDay.toString().length == 1) {
      value = "0$isDay";
      log(value, name: 'month');
    } else {
      value = "$isDay";
      log(value, name: 'month');
    }
    return value;
  }

  String month(int isMount) {
    String value = '';
    if (isMount.toString().length == 1) {
      value = "0$isMount";
      log(value, name: 'month');
    } else {
      value = "$isMount";
      log(value, name: 'month');
    }
    return value;
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

  String valueBtn() {
    return valueButton.value = amountC.text;
  }

  @override
  void onInit() {
    valueBtn();
    final dataTransaksi = firebaseMethod.getTransaction().snapshots();
    dataTransaksi.listen((event) {
      if (event.size != 0) {
        listTransaksi = List.generate(
          event.docs.length,
          (index) => TransaksiModel.fromDocumentSnapshot(event.docs[index]),
        );
        change(listTransaksi, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    });
    super.onInit();
  }
}
