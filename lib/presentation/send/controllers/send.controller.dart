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
  final isAmount = 0.obs;

  List<TransaksiModel> listTransaksi = [];
  List<TransaksiModel> listTransaksiUserLogin = [];

  void loadingState() {
    isLoading.value = !isLoading.value;
  }

  void toNewDelivery() {
    Get.toNamed(Routes.ADD_NEW_DELIVERY);
  }

  void onChanged(String value) {
    log(value);
    isAmount.value = int.tryParse(value) ?? 0;
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
      final userLoginReference =
          firebaseMethod.getUserByID(dashboardC.userModel!.id);
      final toUserReference = firebaseMethod.getUserByID(idUser);
      if (amountC.text != '') {
        log('lolos');
        log(amountC.text);
        final String amount = amountC.text.replaceAll(',', '');
        final int fixAmount = int.parse(amount);
        final UserModel user = dashboardC.userModel!;
        if (fixAmount <= user.savings!) {
          log(amount);
          loadingState();
          firebaseMethod.addTransaction(
            data: TransaksiModel(
              userLogin: userLoginReference,
              toUser: toUserReference,
              amount: fixAmount,
              uploadDate: Timestamp.now(),
            ).toMap(),
          );
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
            "over balance",
            colorText: AppColor.red,
          );
        }
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
    final dataTransaksi = firebaseMethod.getTransaction().snapshots();
    dataTransaksi.listen((event) {
      if (event.size != 0) {
        listTransaksi = List.generate(event.docs.length, (index) {
          return TransaksiModel.fromDocumentSnapshot(event.docs[index]);
        });
        final idUserLogin = dashboardC.userModel!.id;
        listTransaksiUserLogin = listTransaksi
            .where(
              (e) => e.userLogin!.id == idUserLogin && e.isRequest == false,
            )
            .toList();
        listTransaksiUserLogin
            .sort((a, b) => b.uploadDate.compareTo(a.uploadDate));
        change(listTransaksiUserLogin, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    });
    super.onInit();
  }
}
