import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/extensions/extensions.dart';
import 'package:sea_cinema_frontend/app/routes/app_pages.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';
import 'package:supercharged/supercharged.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
      child: Column(
        children: [
          // * Header
          const Header('My Profile'),
          // * Image Profile
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: grayColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: (NetworkImage(
                    controller.userController.user.value.getUrlAvatar)),
              ),
            ),
          ),
          // * Name
          Text(
            controller.userController.user.value.name,
            style: semiBoldPoppinsFontStyle.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 5),
          // * Username
          Text(
            controller.userController.user.value.username,
            style: mediumPoppinsFontStyle.copyWith(color: grayColor),
          ),
          SizedBox(height: 30),
          // * Edit Profile
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: darkGrayColor,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: EdgeInsets.only(right: 12),
                            child:
                                SvgPicture.asset('assets/ic_edit_profile.svg'),
                          ),
                          Text(
                            'Edit Profile',
                            style: mediumPoppinsFontStyle.copyWith(
                              fontSize: 18,
                              color: 'CACBCE'.toColor(),
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset('assets/ic_chevron_right.svg'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // * My Wallet
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: darkGrayColor,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Get.toNamed(Routes.WALLET);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: EdgeInsets.only(right: 12),
                            child: SvgPicture.asset('assets/ic_wallet.svg'),
                          ),
                          Text(
                            'My Wallet',
                            style: mediumPoppinsFontStyle.copyWith(
                              fontSize: 18,
                              color: 'CACBCE'.toColor(),
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset('assets/ic_chevron_right.svg'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // * Help
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: darkGrayColor,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: EdgeInsets.only(right: 12),
                            child: SvgPicture.asset('assets/ic_help.svg'),
                          ),
                          Text(
                            'Help',
                            style: mediumPoppinsFontStyle.copyWith(
                              fontSize: 18,
                              color: 'CACBCE'.toColor(),
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset('assets/ic_chevron_right.svg'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Button(
              text: "Log Out",
              onTap: () {
                controller.logout();
              }),
        ],
      ),
    );
  }
}
