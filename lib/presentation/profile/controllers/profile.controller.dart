import 'package:get/get.dart';
import 'package:mobile_bangking/domain/models/user.dart';
import 'package:mobile_bangking/presentation/dashboard/controllers/dashboard.controller.dart';

class ProfileController extends GetxController {
  final UserModel? userLogin = Get.find<DashboardController>().userModel;
}
