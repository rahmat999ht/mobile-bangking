import 'dart:developer';

import 'package:packages/button/button_outline.dart';

import '../../../app/core/core.dart';

class TransaksiController extends GetxController
    with StateMixin<List<TransaksiModel>> {
  final dashboardC = Get.find<DashboardController>();
  final firebaseMethod = FirebaseMethod();
  // final filterC = TextEditingController(text: 'ToDay');
  // final filter = false.obs;
  final valueFilter = 'ToDay'.obs;
  final listFilter = [
    'ToDay',
    'See All',
  ];

  List<TransaksiModel> listTransaksi = [];
  List<TransaksiModel> listTransaksiUserLogin = [];

  Future alertFilter() async {
    return await Get.defaultDialog(
      title: 'Filter',
      content: Column(
        children: listFilter
            .map(
              (e) => ButtonOutline(
                text: e,
                width: Get.width * 0.4,
                fontColor: AppColor.primary,
                colorBorder: AppColor.shadowColor,
                onPressed: () {
                  valueFilter.value = e;
                  log(valueFilter.value, name: 'value onTap');
                  if (valueFilter.value == 'ToDay') {
                    final toDay = listTransaksiUserLogin
                        .where((e) =>
                            e.uploadDate.toDate().day == DateTime.now().day)
                        .toList();
                    log(valueFilter.value, name: 'value toDay');
                    onChanged(toDay);
                  } else {
                    log(valueFilter.value, name: 'value See all');
                    onChanged(listTransaksiUserLogin);
                  }
                  Get.back();
                },
              ),
            )
            .toList(),
      ),
    );
  }

  void onChanged(List<TransaksiModel> listValue) {
    change(listValue, status: RxStatus.success());
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

  @override
  void onInit() {
    final dataTransaksi = firebaseMethod.getTransaction().snapshots();
    dataTransaksi.listen((event) {
      if (event.size != 0) {
        listTransaksi = List.generate(
          event.docs.length,
          (index) => TransaksiModel.fromDocumentSnapshot(event.docs[index]),
        );
        final idUserLogin = dashboardC.userModel!.id;
        listTransaksiUserLogin = listTransaksi
            .where(
              (e) => e.userLogin!.id == idUserLogin,
            )
            .toList();
        onChanged(listTransaksiUserLogin);
      } else {
        change([], status: RxStatus.empty());
      }
    });
    super.onInit();
  }
}
