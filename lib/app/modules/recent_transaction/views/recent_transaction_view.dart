import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sea_cinema_frontend/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';
import 'package:supercharged/supercharged.dart';

class RecentTransactionView extends StatelessWidget {
  final controller = Get.put(WalletController());

  RecentTransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
      isListView: false,
      child: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * Header
                    const Header('My Transaction', isBack: false),
                    // * ID Card
                    Container(
                      height: 185,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: 'EBA352'.toColor(),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          ClipPath(
                            clipper: CardReflectionClipper(15),
                            child: Container(
                              height: 185,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Colors.white.withOpacity(0.15),
                                    Colors.white.withOpacity(0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // * Noise
                          Image.asset(
                            'assets/bg_noise.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 18,
                                      height: 18,
                                      margin: EdgeInsets.only(right: 4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: whiteColor,
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: redColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Obx(
                                  () => Text(
                                    NumberFormat.currency(
                                      locale: 'id_ID',
                                      decimalDigits: 0,
                                      symbol: 'IDR ',
                                    ).format(controller
                                        .userController.user.value.balance),
                                    style: semiBoldPoppinsFontStyle.copyWith(
                                      fontSize: 28,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Card Holder',
                                          style:
                                              regularPoppinsFontStyle.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                            controller
                                                .userController.user.value.name,
                                            style: mediumPoppinsFontStyle),
                                      ],
                                    ),
                                    SizedBox(width: 30),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Card ID',
                                          style:
                                              regularPoppinsFontStyle.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text('SEACINEMA',
                                            style: mediumPoppinsFontStyle),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    // * Recent Transactions
                    Text(
                      "Recent Transactions",
                      style: mediumPoppinsFontStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => controller.isLoading == true
                          ? makeLoadingIndicator()
                          : Column(children: [
                              for (var transaction in controller.transactions)
                                TransactionCard(transaction),
                            ]),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
          // * Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    text: "Top Up",
                    width: MediaQuery.of(context).size.width / 2 - 15,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => ModalTopup(),
                      );
                    },
                  ),
                  const SizedBox(width: 15),
                  Obx(
                    () => controller.isLoadingTopup == true
                        ? makeLoadingIndicator()
                        : Button(
                            text: "Withdraw",
                            width: MediaQuery.of(context).size.width / 2 - 15,
                            buttonStyle: makeButton(grayColor),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => ModalWithDraw(),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardReflectionClipper extends CustomClipper<Path> {
  final double offset;

  CardReflectionClipper(this.offset);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - this.offset);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
