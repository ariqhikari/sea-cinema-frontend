import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sea_cinema_frontend/app/extensions/extensions.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';
import 'package:sea_cinema_frontend/app/widgets/widgets.dart';

import '../controllers/top_up_controller.dart';

class TopUpView extends GetView<TopUpController> {
  const TopUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
      child: Column(children: [
        // * Header
        const Header('Top Up'),
        // * Input TopUp
        InputText(
          controller: controller.amountController,
          hint: 'Type amount...',
          validator: (value) {
            if (value!.isEmpty) {
              return 'Mohon masukkan username dengan benar';
            }

            return null;
          },
          onChanged: (text) {
            if (text == null) return;

            String amount = '';

            for (int i = 0; i < text.length; i++) {
              amount += text.isDigit(i) ? text[i] : '';
            }

            controller.selectedAmount.value = int.tryParse(amount) ?? 0;

            controller.amountController.text = NumberFormat.currency(
              locale: 'id_ID',
              decimalDigits: 0,
              symbol: 'Rp ',
            ).format(controller.selectedAmount.value);

            controller.amountController.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.amountController.text.length));
          },
        ),
        SizedBox(height: 20),
        // * Template TopUp
        Text(
          'Choose by Template',
          style: regularPoppinsFontStyle,
        ),
        SizedBox(height: 14),
        // Wrap(
        //   spacing: 20,
        //   runSpacing: 14,
        //   children: generateMoneyCardWidgets(cardWidth),
        // ),
        SizedBox(height: 102),
        // * Top Up Button
        SizedBox(height: 80),
      ]),
    );
  }
}
