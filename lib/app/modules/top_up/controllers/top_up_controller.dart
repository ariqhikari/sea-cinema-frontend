import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUpController extends GetxController {
  TextEditingController amountController = TextEditingController(text: 'Rp 0');
  var selectedAmount = 0.obs;
}
