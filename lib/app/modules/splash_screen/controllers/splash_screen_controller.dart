import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/modules/user/user_controller.dart';
import 'package:sea_cinema_frontend/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final UserController userController = Get.find<UserController>();

  moveToHome() async {
    await userController.verifyToken();

    Future.delayed(const Duration(seconds: 3), () {
      if (userController.user.value.name == "") {
        Get.offAllNamed(Routes.SIGN_IN);
      } else {
        Get.offAllNamed(Routes.MAIN);
      }
    });
  }
}
