import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/modules/user/user_controller.dart';
import 'package:sea_cinema_frontend/app/routes/app_pages.dart';
import 'package:sea_cinema_frontend/app/services/services.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';

class SummaryController extends GetxController {
  final UserController userController = Get.find<UserController>();
  late Movie movie;
  late Showtime showtime;
  late Transaction transaction;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    movie = Get.arguments[0];
    showtime = Get.arguments[1];
    transaction = Get.arguments[2];
  }

  Future<void> bookingMovie() async {
    isLoading.value = true;
    ApiReturnValue<bool> result =
        await TransactionServices.createTransaction(transaction);

    isLoading.value = false;

    if (result.value == null) {
      showSnackBar(result.message!);
      return;
    }

    Get.offAllNamed(Routes.BOOKING_SUCCESS);
    showSnackBar("Transaksi berhasil!", status: "Success");
  }
}
