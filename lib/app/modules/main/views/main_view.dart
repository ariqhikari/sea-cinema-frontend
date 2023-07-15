import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/modules/home/views/home_view.dart';
import 'package:sea_cinema_frontend/app/modules/my_profile/views/my_profile_view.dart';
import 'package:sea_cinema_frontend/app/modules/recent_transaction/views/recent_transaction_view.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      brightness: Brightness.dark,
      child: Scaffold(
        backgroundColor: blackColor,
        // * Floating Button
        // floatingActionButton: Container(
        //   width: 66,
        //   height: 66,
        //   padding: const EdgeInsets.all(5),
        //   margin: const EdgeInsets.only(bottom: 65),
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     color: greyColor,
        //   ),
        //   child: CustomTooltip(
        //     message: 'Pinjam Ruangan',
        //     child: FloatingActionButton(
        //       heroTag: 'main_btn',
        //       elevation: 0,
        //       focusElevation: 0,
        //       highlightElevation: 0,
        //       hoverElevation: 0,
        //       backgroundColor: yellowColor,
        //       child: SvgPicture.asset('assets/ic_book.svg'),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => const BookingPage(),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // * Body
        body: Stack(
          children: [
            // * Page View
            PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.selectedPage.value = index;
              },
              children: [
                // * Home Page
                HomeView(),
                // * Transaction Page
                RecentTransactionView(),
                // * Profile Page
                MyProfileView(),
              ],
            ),
            // * Bottom Navigation
            Obx(
              () => CustomBottomNavigation(
                selectedIndex: controller.selectedPage.value,
                onTap: (index) {
                  controller.selectedPage.value = index;
                  controller.pageController.animateToPage(
                    controller.selectedPage.value,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 400),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
