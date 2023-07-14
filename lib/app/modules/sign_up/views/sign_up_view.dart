import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/shared/shared_methods.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
      isListView: false,
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Header
            const Header('Create New\nYour Account'),
            // * Avatar
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 24),
                width: 90,
                height: 104,
                child: Stack(
                  children: [
                    Obx(
                      () => Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: grayColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: (controller.avatar.value == '')
                                ? AssetImage('assets/user_pic.png')
                                    as ImageProvider
                                : FileImage(File(controller.avatar.value)),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                          onTap: () async {
                            if (controller.avatar.value == '') {
                              controller.avatar.value = await getImage();
                            } else {
                              controller.avatar.value = '';
                            }
                          },
                          child: Obx(
                            () => Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      (controller.avatar.value == '')
                                          ? 'assets/btn_add_photo.png'
                                          : 'assets/btn_del_photo.png'),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            // * Username
            Text(
              "Username",
              style: mediumPoppinsFontStyle.copyWith(
                fontSize: 18,
                color: grayColor,
              ),
            ),
            const SizedBox(height: 8),
            InputText(
              controller: controller.usernameController,
              hint: 'Type username...',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Mohon masukkan username dengan benar';
                }

                return null;
              },
            ),
            const SizedBox(height: 24),
            // * Password
            Text(
              "Password",
              style: mediumPoppinsFontStyle.copyWith(
                fontSize: 18,
                color: grayColor,
              ),
            ),
            const SizedBox(height: 8),
            InputPassword(
              controller: controller.passwordController,
              hint: 'Type password...',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Mohon masukkan password dengan benar';
                }

                return null;
              },
            ),
            const SizedBox(height: 24),
            // * Full Name
            Text(
              "Full Name",
              style: mediumPoppinsFontStyle.copyWith(
                fontSize: 18,
                color: grayColor,
              ),
            ),
            const SizedBox(height: 8),
            InputText(
              controller: controller.fullNameController,
              hint: 'Type full name...',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Mohon masukkan nama dengan benar';
                }

                return null;
              },
            ),
            const SizedBox(height: 24),
            // * Age
            Text(
              "Age",
              style: mediumPoppinsFontStyle.copyWith(
                fontSize: 18,
                color: grayColor,
              ),
            ),
            const SizedBox(height: 8),
            InputText(
              controller: controller.ageController,
              hint: 'Type age...',
              isNumber: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Mohon masukkan umur dengan benar';
                }

                return null;
              },
            ),
            const SizedBox(height: 30),
            Obx(
              () => controller.isLoading == true
                  ? makeLoadingIndicator()
                  : Button(
                      text: "Sign Up",
                      onTap: () async {
                        if (controller.formKey.currentState!.validate()) {
                          await controller.register();
                        }
                      }),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
