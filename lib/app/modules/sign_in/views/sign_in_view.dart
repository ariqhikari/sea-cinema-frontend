import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/routes/app_pages.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';
import 'package:supercharged/supercharged.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
      isListView: false,
      child: Form(
        key: controller.formKey,
        child: Stack(
          children: [
            // * Background
            Image.asset(
              'assets/bg_login.jpeg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // * Linear
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  '090909'.toColor().withOpacity(0),
                  '090909'.toColor().withOpacity(.9),
                  '090909'.toColor(),
                ],
              )),
            ),
            // * Content
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: ListView(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 250
                          : 50),
                  Text(
                    "Sign In",
                    style: semiBoldPoppinsFontStyle.copyWith(fontSize: 40),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "You'll find what you're looking for in the ocean of movies",
                    style: mediumPoppinsFontStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 25),
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
                  const SizedBox(height: 30),
                  Obx(
                    () => controller.isLoading == true
                        ? makeLoadingIndicator()
                        : Button(
                            text: "Sign In",
                            onTap: () async {
                              if (controller.formKey.currentState!.validate()) {
                                await controller.login();
                              }
                            }),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start fresh now?',
                        style: regularPoppinsFontStyle,
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGN_UP);
                        },
                        child: Text(
                          'Sign Up',
                          style: mediumPoppinsFontStyle.copyWith(
                            color: orangeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
