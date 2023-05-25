import 'dart:developer';

import '../../../app/core/core.dart';

class DashboardController extends GetxController with StateMixin<UserModel> {
  final RxInt selectedIndex = 0.obs;
  late List<Widget> widgetOptions = <Widget>[];
  final isLoading = true.obs;
  UserModel? userModel;
  late final List<UserModel> dataUSer;

  final listNameMonth = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Mei",
    "Jun",
    "Jul",
    "Agu",
    "Sep",
    "Okt",
    "Nov",
    "Des"
  ];

  String formatRupiah(String amount) {
    final formattedAmount = amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match.group(1)}.');
    return 'Rp. $formattedAmount';
  }

  @override
  void onInit() async {
    // final prefs = await SharedPreferences.getInstance();
    String? isId = 'lmvELG5GAMiTjtsGhh2Z';
    log(isId);
    final dataAllUser =
        await Utils.firebaseFirestore.collection(Utils.usersCollection).get();
    dataUSer =
        dataAllUser.docs.map((e) => UserModel.fromDocumentSnapshot(e)).toList();

    var dataUserModel = dataAllUser.docs.firstWhere((e) => e.id == isId);
    userModel = UserModel.fromDocumentSnapshot(dataUserModel);
    successState(userModel!);
    selectedIndex.value = 0;
    widgetOptions = [
      const HomeScreen(),
      const ProfileScreen(),
    ];
    super.onInit();
  }

  void loadingState() {
    change(
      null,
      status: RxStatus.loading(),
    );
  }

  void successState(UserModel userModel) {
    change(
      userModel,
      status: RxStatus.success(),
    );
  }
}
