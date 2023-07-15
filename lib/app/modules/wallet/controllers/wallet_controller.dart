import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/modules/user/user_controller.dart';
import 'package:sea_cinema_frontend/app/services/services.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';

class WalletController extends GetxController {
  final UserController userController = Get.find<UserController>();
  TextEditingController topupController = TextEditingController(text: 'Rp 0');
  TextEditingController withdrawController =
      TextEditingController(text: 'Rp 0');
  var transactions = [].obs;
  var isLoading = false.obs;

  var topupAmount = 0.obs;
  var isLoadingTopup = false.obs;

  var withdrawAmount = 0.obs;
  var isLoadingWithdraw = false.obs;

  @override
  void onInit() async {
    super.onInit();
    transactions.value = await getRecentTransaction();
  }

  Future<List<Transaction>> getRecentTransaction() async {
    isLoading.value = true;

    ApiReturnValue<List<Transaction>> result =
        await TransactionServices.getTransactions();

    isLoading.value = false;

    if (result.value == null) {
      return [];
    }

    return result.value!;
  }

  Future<void> topUp() async {
    isLoadingTopup.value = true;

    User newUser = userController.user.value.copyWith(
      balance: userController.user.value.balance + topupAmount.value,
    );

    ApiReturnValue<User> result = await AuthServices.updateProfile(
        user: newUser,
        transaction: {"transaction": "TOPUP", "totalCost": topupAmount.value});

    isLoadingTopup.value = false;

    if (result.value == null) {
      showSnackBar(result.message!);
    }

    userController.user.value = newUser;

    Get.back();
    showSnackBar("Top Up berhasil!", status: "Success");
    transactions.value = await getRecentTransaction();
  }

  Future<void> withdraw() async {
    isLoadingWithdraw.value = true;

    User newUser = userController.user.value.copyWith(
      balance: userController.user.value.balance - withdrawAmount.value,
    );

    ApiReturnValue<User> result = await AuthServices.updateProfile(
        user: newUser,
        transaction: {
          "transaction": "WITHDRAW",
          "totalCost": withdrawAmount.value
        });

    isLoadingWithdraw.value = false;

    if (result.value == null) {
      showSnackBar(result.message!);
    }

    userController.user.value = newUser;

    Get.back();
    showSnackBar("Withdraw berhasil!", status: "Success");
    transactions.value = await getRecentTransaction();
  }
}
