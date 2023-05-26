import 'dart:developer';

import '../../../app/core/core.dart';

class TransaksiController extends GetxController
    with StateMixin<List<InitTransaksi>> {
  final dashboardC = Get.find<DashboardController>();
  final firebaseMethod = FirebaseMethod();
  final valueFilter = 'See All'.obs;
  final listFilter = [
    'ToDay',
    'See All',
  ];

  List<InitTransaksi> listTransaksi = [];
  List<InitTransaksi> listTransaksiUserLogin = [];

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

  void onChanged(List<InitTransaksi> listValue) {
    change(listValue, status: RxStatus.success());
  }

  String zeroLeft(int isInt) {
    String value = '';
    if (isInt.toString().length == 1) {
      value = "0$isInt";
    } else {
      value = "$isInt";
    }
    return value;
  }

  @override
  void onInit() {
    final dataTransaksi = firebaseMethod.getTransaction().snapshots();
    dataTransaksi.listen((event) {
      if (event.size != 0) {
        listTransaksi = List.generate(event.docs.length, (index) {
          if (event.docs[index]['isRequest'] == false) {
            return TransaksiModel.fromDocumentSnapshot(event.docs[index]);
          } else {
            return RequestModel.fromDocumentSnapshot(event.docs[index]);
          }
        });
        final idUserLogin = dashboardC.userModel!.id;
        listTransaksiUserLogin =
            listTransaksi.where((e) => e.userLogin!.id == idUserLogin).toList();
        listTransaksiUserLogin
            .sort((a, b) => b.uploadDate.compareTo(a.uploadDate));

        onChanged(listTransaksiUserLogin);
      } else {
        change([], status: RxStatus.empty());
      }
    });
    super.onInit();
  }
}
