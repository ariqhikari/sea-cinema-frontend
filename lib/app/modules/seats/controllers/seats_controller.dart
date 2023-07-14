import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';

class SeatsController extends GetxController {
  late Movie movie;
  late Showtime showtime;
  var bookingSeat = [].obs;
  var totalPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    movie = Get.arguments[0];
    showtime = Get.arguments[1];
  }

  void onSelectSeat(String seat) {
    if (bookingSeat.contains(seat)) {
      bookingSeat.remove(seat);
    } else {
      if (bookingSeat.length == 6) {
        showSnackBar("Jumlah maksimum pemesanan kursi adalah 6!");
        return;
      }
      bookingSeat.add(seat);
    }
    totalPrice.value = movie.price * bookingSeat.length;
  }

  String seatNumber(int i, int index) {
    return '${String.fromCharCode(i + 65)}${index + 1}';
  }

  bool checkBookingSeat(String seat) {
    return showtime.seats[seat] ?? false;
  }
}
