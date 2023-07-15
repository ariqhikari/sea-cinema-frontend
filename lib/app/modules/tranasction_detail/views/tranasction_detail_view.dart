import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/extensions/extensions.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/shared/shared_methods.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';

import '../controllers/tranasction_detail_controller.dart';

class TranasctionDetailView extends GetView<TranasctionDetailController> {
  const TranasctionDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
      child: Column(
        children: [
          // * Header
          const Header('Transaction Detail'),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 170,
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: DecorationImage(
                image: NetworkImage(
                    controller.transaction.showtime!.movie!.poster),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ClipPath(
            clipper: TicketTopClipper(),
            child: Container(
              width: double.infinity,
              color: whiteColor,
              padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    controller.transaction.showtime!.movie!.title,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: mediumPoppinsFontStyle.copyWith(
                      fontSize: 18,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    controller.transaction.showtime!.movie!.getGenres,
                    style: regularPoppinsFontStyle.copyWith(color: grayColor),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  RatingStars(
                      voteAverage: controller
                          .transaction.showtime!.movie!.rating
                          .toDouble()),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Date & Time",
                        style: regularPoppinsFontStyle,
                      ),
                      Text(
                        controller.transaction.showtime!.date.dateYear,
                        style:
                            mediumPoppinsFontStyle.copyWith(color: blackColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Seat Numbers", style: regularPoppinsFontStyle),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          controller.transaction.bookingSeat!.join(', '),
                          textAlign: TextAlign.end,
                          style: mediumPoppinsFontStyle.copyWith(
                              color: blackColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Transaction Code", style: regularPoppinsFontStyle),
                      Text(
                        controller.transaction.transactionCode,
                        style:
                            mediumPoppinsFontStyle.copyWith(color: blackColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Status", style: regularPoppinsFontStyle),
                        Text(
                          controller.status.value == StatusTransaction.SUCCESS
                              ? "SUCCESS"
                              : "CANCEL",
                          style: mediumPoppinsFontStyle.copyWith(
                            color: controller.status.value ==
                                    StatusTransaction.SUCCESS
                                ? greenColor
                                : redColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  generateDashedDivider(MediaQuery.of(context).size.width -
                      2 * defaultMargin -
                      40)
                ],
              ),
            ),
          ),
          ClipPath(
            clipper: TicketBottomClipper(),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Name: ", style: regularPoppinsFontStyle),
                      Text(
                        controller.userController.user.value.name,
                        style:
                            mediumPoppinsFontStyle.copyWith(color: blackColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Paid: ", style: regularPoppinsFontStyle),
                      Text(
                        NumberFormat.currency(
                                locale: "id_ID",
                                decimalDigits: 0,
                                symbol: "IDR ")
                            .format(controller.transaction.totalCost),
                        style:
                            mediumPoppinsFontStyle.copyWith(color: blackColor),
                      ),
                    ],
                  ),
                  QrImage(
                    version: 6,
                    foregroundColor: Colors.black,
                    errorCorrectionLevel: QrErrorCorrectLevel.M,
                    padding: EdgeInsets.all(0),
                    size: 100,
                    data: controller.transaction.transactionCode,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Obx(
            () => controller.isLoading == true
                ? makeLoadingIndicator()
                : controller.status.value == StatusTransaction.SUCCESS
                    ? Button(
                        text: 'Cancel Booking',
                        buttonStyle: makeButton(redColor),
                        onTap: () async {
                          controller.cancelBooking();
                        },
                      )
                    : const SizedBox(),
          )
        ],
      ),
    );
  }
}

class TicketTopClipper extends CustomClipper<Path> {
  double radius = 15;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(radius, size.height - radius, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(size.width - radius, size.height - radius,
        size.width, size.height - radius);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TicketBottomClipper extends CustomClipper<Path> {
  double radius = 15;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width - radius, radius, size.width - radius, 0);
    path.lineTo(radius, 0);
    path.quadraticBezierTo(radius, radius, 0, radius);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
