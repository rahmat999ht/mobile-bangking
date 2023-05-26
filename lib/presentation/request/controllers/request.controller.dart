import 'dart:developer';

import 'package:mobile_bangking/app/core/core.dart';

class RequestController extends GetxController {
  final dashboardC = Get.find<DashboardController>();
  final firebaseMethod = FirebaseMethod();

  final formKey = GlobalKey<FormState>();
  final amountC = TextEditingController();
  final accountNumberC = TextEditingController();
  final bankC = TextEditingController();
  final descriptionC = TextEditingController();

  final isLoading = false.obs;

  void loadingState() {
    isLoading.value = !isLoading.value;
  }

  final listBank = [
    'BRI',
    'BNI',
  ];

  Future alertBank() async {
    return await Get.defaultDialog(
      title: 'Select',
      content: Column(
        children: listBank
            .map((e) => ButtonOutline(
                  text: e,
                  width: Get.width * 0.4,
                  fontColor: AppColor.primary,
                  colorBorder: AppColor.shadowColor,
                  onPressed: () {
                    bankC.text = e;
                    Get.back();
                  },
                ))
            .toList(),
      ),
    );
  }

  void send() async {
    log('mulai');
    try {
      if (formKey.currentState!.validate()) {
        final dataUser = await firebaseMethod
            .getUser()
            .where(
              'noRek',
              isEqualTo: int.parse(accountNumberC.text),
            )
            .where(
              'typeBank',
              isEqualTo: bankC.text,
            )
            .get();
        if (dataUser.size != 0) {
          log('ada ${dataUser.docs.first.data()}');
          final idUser = dataUser.docs.first.id;
          log('cek');
          log('user = $idUser');
          if (amountC.text != '') {
            log('lolos');
            loadingState();
            log(amountC.text);
            final String amount = amountC.text.replaceAll(',', '');
            final int fixAmount = int.parse(amount);
            log(amount);
            final userLoginReference =
                firebaseMethod.getUserIdFromMap(dashboardC.userModel!.id);
            final toUserReference = firebaseMethod.getUserIdFromMap(idUser);
            log('userLogin = $userLoginReference');
            log('toUser = $toUserReference');
            await firebaseMethod.addTransaction(
              data: RequestModel(
                userLogin: userLoginReference,
                toUser: toUserReference,
                amount: fixAmount,
                uploadDate: Timestamp.now(),
                descriptions: descriptionC.text,
              ).toMap(),
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
        } else {
          Get.defaultDialog(
            title: 'Info',
            middleText: 'unregistered user',
            confirm: Center(
              child: ButtonOutline(
                text: 'OK',
                width: Get.width * 0.2,
                colorBorder: AppColor.primary,
                fontColor: AppColor.primary,
                onPressed: Get.back,
              ),
            ),
          );
        }
      } else {
        Get.snackbar(
          'Info',
          "Please input to all form",
        );
      }
    } catch (e) {
      Get.snackbar(
        'Info',
        "Pesan error $e",
      );
    }
  }
}
