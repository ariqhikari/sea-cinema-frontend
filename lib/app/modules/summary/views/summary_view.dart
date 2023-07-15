import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sea_cinema_frontend/app/extensions/extensions.dart';
import 'package:sea_cinema_frontend/app/routes/app_pages.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';
import 'package:supercharged/supercharged.dart';

import '../controllers/summary_controller.dart';

class SummaryView extends GetView<SummaryController> {
  const SummaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var totalPrice = controller.transaction.totalCost +
        (1500 * controller.transaction.bookingSeat!.length);

    return ScaffoldDefault(
        child: Column(
      children: [
        // * Header
        const Header('Summary'),
        // * Card Summary
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: darkGrayColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // * Image
                  Container(
                    width: 95,
                    height: 120,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: grayColor,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(controller.movie.poster),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // * Detail
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // * Title
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 3,
                        child: Text(
                          controller.movie.title,
                          style: mediumPoppinsFontStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      // * Age Rating
                      Container(
                        width: 40,
                        height: 20,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: 'F5F6F8'.toColor(),
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          '${controller.movie.ageRating}+',
                          textAlign: TextAlign.center,
                          style: regularPoppinsFontStyle.copyWith(
                            color: blackColor,
                          ),
                        ),
                      ),
                      // * Genre
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 3,
                        child: Text(
                          controller.movie.getGenres,
                          style: regularPoppinsFontStyle.copyWith(
                            color: 'CACBCE'.toColor(),
                          ),
                        ),
                      ),
                      Text(controller.movie.duration,
                          style: regularPoppinsFontStyle.copyWith(
                              color: 'CACBCE'.toColor())),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // * Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Date',
                    style: regularPoppinsFontStyle.copyWith(
                        color: '878787'.toColor()),
                  ),
                  Text(
                    controller.showtime.date.dateYear,
                    textAlign: TextAlign.right,
                    style: mediumPoppinsFontStyle,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // * Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Time',
                    style: regularPoppinsFontStyle.copyWith(
                        color: '878787'.toColor()),
                  ),
                  Text(
                    controller.showtime.time.formatString(),
                    textAlign: TextAlign.right,
                    style: mediumPoppinsFontStyle,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // * Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Seats',
                    style: regularPoppinsFontStyle.copyWith(
                        color: '878787'.toColor()),
                  ),
                  Text(
                    controller.transaction.bookingSeat!.join(', '),
                    textAlign: TextAlign.right,
                    style: mediumPoppinsFontStyle,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // * Divider
              Divider(color: '878787'.toColor(), thickness: 1),
              const SizedBox(height: 15),
              // * Summary
              Text(
                'Summary',
                style:
                    regularPoppinsFontStyle.copyWith(color: '878787'.toColor()),
              ),
              const SizedBox(height: 8),
              // * Subtotal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sub-total',
                    style: mediumPoppinsFontStyle.copyWith(
                        color: '878787'.toColor()),
                  ),
                  Text(
                    '${NumberFormat.currency(
                      locale: 'id_ID',
                      decimalDigits: 0,
                      symbol: 'Rp ',
                    ).format(controller.movie.price)} x ${controller.transaction.bookingSeat!.length}',
                    textAlign: TextAlign.right,
                    style: mediumPoppinsFontStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              // * Fee
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Fee',
                    style: mediumPoppinsFontStyle.copyWith(
                        color: '878787'.toColor()),
                  ),
                  Text(
                    '${NumberFormat.currency(
                      locale: 'id_ID',
                      decimalDigits: 0,
                      symbol: 'Rp ',
                    ).format(1500)} x ${controller.transaction.bookingSeat!.length}',
                    textAlign: TextAlign.right,
                    style: mediumPoppinsFontStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // * Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total',
                    style: mediumPoppinsFontStyle.copyWith(
                      color: '878787'.toColor(),
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id_ID',
                      decimalDigits: 0,
                      symbol: 'Rp ',
                    ).format(totalPrice),
                    textAlign: TextAlign.right,
                    style: semiBoldPoppinsFontStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
              // * Divider
              const SizedBox(height: 15),
              Divider(color: '878787'.toColor(), thickness: 1),
              const SizedBox(height: 15),
              // * Wallet
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Your Wallet',
                      style: mediumPoppinsFontStyle.copyWith(
                        color: '878787'.toColor(),
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        decimalDigits: 0,
                        symbol: 'Rp ',
                      ).format(controller.userController.user.value.balance),
                      textAlign: TextAlign.right,
                      style: semiBoldPoppinsFontStyle.copyWith(
                          fontSize: 18,
                          color: controller.userController.user.value.balance >=
                                  totalPrice
                              ? greenColor
                              : redColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        // * Checkout Now
        Obx(
          () => controller.isLoading == true
              ? makeLoadingIndicator()
              : Button(
                  text:
                      controller.userController.user.value.balance >= totalPrice
                          ? "Checkout Now"
                          : "Top Up",
                  onTap: () async {
                    if (controller.userController.user.value.balance <
                        totalPrice) {
                      // * Top up
                      Get.toNamed(Routes.WALLET);
                    } else {
                      // * Checkout
                      controller.transaction = controller.transaction.copyWith(
                        totalCost: totalPrice,
                      );

                      await controller.bookingMovie();
                    }
                  }),
        ),
        const SizedBox(height: 30),
      ],
    ));
  }
}
