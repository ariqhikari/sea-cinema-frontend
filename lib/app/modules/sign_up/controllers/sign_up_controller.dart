import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/services/services.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  RxString avatar = ''.obs;
  RxBool isLoading = false.obs;

  Future<void> register() async {
    if (avatar.value == '') {
      showSnackBar("Mohon mengisi gambar profil terlebih dahulu!");
      return;
    }

    isLoading.value = true;
    ApiReturnValue<bool> result = await AuthServices.signUp(
      User(
        name: fullNameController.text,
        username: usernameController.text,
        age: int.parse(ageController.text),
        avatar: avatar.value,
      ),
      passwordController.text,
    );

    isLoading.value = false;

    if (result.value == null) {
      showSnackBar(result.message!);
      return;
    }

    Get.back();
    showSnackBar(result.message!, status: "Success");
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    ageController.dispose();
    super.onClose();
  }
}
