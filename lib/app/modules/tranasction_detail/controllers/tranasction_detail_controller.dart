import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/modules/user/user_controller.dart';
import 'package:sea_cinema_frontend/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:sea_cinema_frontend/app/services/services.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';

class TranasctionDetailController extends GetxController {
  final UserController userController = Get.find<UserController>();
  final WalletController walletController = Get.find<WalletController>();
  late Transaction transaction;
  var isLoading = false.obs;
  var status = StatusTransaction.SUCCESS.obs;

  void onInit() {
    super.onInit();
    transaction = Get.arguments[0];
    status.value = transaction.status;
  }

  Future<void> cancelBooking() async {
    isLoading.value = true;
    ApiReturnValue<bool> result =
        await TransactionServices.cancelBooking(transaction.id);

    isLoading.value = false;

    if (result.value == null) {
      showSnackBar(result.message!);
      return;
    }

    status.value = StatusTransaction.CANCEL;
    updateBalance();
    showSnackBar("Booking berhasil dibatalkan!", status: "Success");
  }

  Future<void> updateBalance() async {
    User newUser = userController.user.value.copyWith(
      balance: userController.user.value.balance + transaction.totalCost,
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
