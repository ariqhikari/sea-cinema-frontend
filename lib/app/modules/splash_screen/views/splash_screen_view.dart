import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        backgroundColor: blackColor,
        body: FutureBuilder(
          future: controller.moveToHome(),
          builder: (context, snapshot) => Stack(
            children: [
              // * Noise
              Image.asset(
                'assets/bg_noise.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              // * Content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png'),
                    const SizedBox(height: 20),
                    Text(
                      'SEA CINEMA',
                      style: semiBoldPoppinsFontStyle.copyWith(fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
