import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/routes/app_pages.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';
import 'package:supercharged/supercharged.dart';

import '../controllers/seats_controller.dart';

class SeatsView extends GetView<SeatsController> {
  const SeatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
      isPadding: false,
      child: Column(
        children: [
          // * Seats
          Column(
            children: [
              // * Header
              const Header('Choose Seats'),
              // * Cinema Screen
              Image.asset(
                'assets/screen.png',
                width: 400,
                height: 70,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 30),
              // * Seats
              Obx(() => generateSeats(context)),
              // * Status Seat
              Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // * Available
                    Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          color: '323232'.toColor(),
                        ),
                        const SizedBox(width: 8),
                        Text('Available', style: regularPoppinsFontStyle),
                      ],
                    ),
                    // * Reserved
                    Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          color: whiteColor,
                        ),
                        const SizedBox(width: 8),
                        Text('Reserved', style: regularPoppinsFontStyle),
                      ],
                    ),
                    // * Selected
                    Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          color: orangeColor,
                        ),
                        const SizedBox(width: 8),
                        Text('Selected', style: regularPoppinsFontStyle),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
          // * Buy Ticket
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: '323232'.toColor(),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30))),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price', style: regularPoppinsFontStyle),
                        Obx(
                          () => Text(
                            NumberFormat.currency(
                              locale: 'id_ID',
                              decimalDigits: 0,
                              symbol: 'Rp ',
                            ).format(controller.totalPrice.value),
                            style:
                                mediumPoppinsFontStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Button(
                      width: MediaQuery.of(context).size.width / 2,
                      text: 'Buy Ticket',
                      onTap: () {
                        if (controller.bookingSeat.isEmpty) {
                          showSnackBar("Mohon pilih kursi terlebih dahulu!");
                          return;
                        }

                        Get.toNamed(
                          Routes.SUMMARY,
                          arguments: [
                            controller.movie,
                            controller.showtime,
                            Transaction(
                              id: '',
                              transactionCode: '',
                              userId: User.id!,
                              showTimeId: controller.showtime.id,
                              bookingSeat: controller.bookingSeat
                                  .map((item) => item as String)
                                  .toList(),
                              totalCost: controller.totalPrice.value,
                              status: StatusTransaction.PENDING,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column generateSeats(BuildContext context) {
    // List<int> numberOfSeats = [3, 5, 5, 5, 5];
    List<int> numberOfSeats = [8, 8, 8, 8, 8, 8, 8];
    List<Widget> widgets = [];

    for (var i = 0; i < numberOfSeats.length; i++) {
      widgets.add(
        Container(
          margin: EdgeInsets.only(
            bottom: (i != numberOfSeats.last - 1 ? 10 : 20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              numberOfSeats[i],
              (index) => Container(
                margin: EdgeInsets.only(
                  right: (index < numberOfSeats[i] - 1 ? 10 : 0),
                ),
                child: SeatCard(
                  controller.seatNumber(i, index),
                  status: controller
                          .checkBookingSeat(controller.seatNumber(i, index))
                      ? StatusSeat.RESERVED
                      : controller.bookingSeat
                              .contains(controller.seatNumber(i, index))
                          ? StatusSeat.SELECTED
                          : StatusSeat.AVAILABLE,
                  onTap: () {
                    if (controller
                        .checkBookingSeat(controller.seatNumber(i, index))) {
                      return;
                    }
                    controller.onSelectSeat(controller.seatNumber(i, index));
                  },
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Column(children: widgets);
  }
}
