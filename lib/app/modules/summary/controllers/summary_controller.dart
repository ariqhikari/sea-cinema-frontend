import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/modules/user/user_controller.dart';
import 'package:sea_cinema_frontend/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:sea_cinema_frontend/app/routes/app_pages.dart';
import 'package:sea_cinema_frontend/app/services/services.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';

class SummaryController extends GetxController {
  final UserController userController = Get.find<UserController>();
  final WalletController walletController = Get.find<WalletController>();
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

    Get.offAllNamed(Routes.MAIN);
    await updateBalance();
    showSnackBar("Transaksi berhasil!", status: "Success");
  }

  Future<void> updateBalance() async {
    User newUser = userController.user.value.copyWith(
      balance: userController.user.value.balance - transaction.totalCost,
    );

    ApiReturnValue<User> result =
        await AuthServices.updateProfile(user: newUser);

    if (result.value == null) {
      showSnackBar(result.message!);
    }

    userController.user.value = newUser;

    walletController.transactions.value =
        await walletController.getRecentTransaction();
  }
}
