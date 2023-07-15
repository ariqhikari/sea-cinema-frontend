import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/modules/user/user_controller.dart';
import 'package:sea_cinema_frontend/app/routes/app_pages.dart';
import 'package:sea_cinema_frontend/app/services/services.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';

class ProfileController extends GetxController {
  final UserController userController = Get.find<UserController>();

  void logout() {
    AuthServices.signOut();
    Get.offAllNamed(Routes.SIGN_IN);
    showSnackBar("Logout berhasil!", status: "Success");
  }
}
