import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_success_controller.dart';

class BookingSuccessView extends GetView<BookingSuccessController> {
  const BookingSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookingSuccessView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookingSuccessView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
