part of 'widgets.dart';

class ModalWithDraw extends StatelessWidget {
  const ModalWithDraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WalletController controller = Get.find<WalletController>();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(
            color: '323232'.toColor(),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30))),
        child: Obx(
          () => ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              const SizedBox(height: 21),
              Text(
                'Withdraw',
                style: mediumPoppinsFontStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // * Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputText(
                    controller: controller.withdrawController,
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

                      controller.withdrawAmount.value =
                          int.tryParse(amount) ?? 0;

                      controller.withdrawController.text =
                          NumberFormat.currency(
                        locale: 'id_ID',
                        decimalDigits: 0,
                        symbol: 'Rp ',
                      ).format(controller.withdrawAmount.value);

                      controller.withdrawController.selection =
                          TextSelection.fromPosition(TextPosition(
                              offset:
                                  controller.withdrawController.text.length));
                    },
                  ),
                  const SizedBox(height: 15),
                  controller.isLoadingWithdraw == true
                      ? makeLoadingIndicator()
                      : Button(
                          text: 'Withdraw Now',
                          buttonStyle: makeButton(greenColor),
                          onTap: () {
                            if (controller.withdrawAmount.value <= 0) {
                              showSnackBar("Masukan jumlah terlebih dahulu!");
                              return;
                            } else if (controller.withdrawAmount.value >
                                controller.userController.user.value.balance) {
                              showSnackBar("Saldo anda tidak mencukupi!");
                              return;
                            }

                            controller.withdraw();
                            controller.withdrawController.text = "Rp 0";
                          }),
                ],
              ),
              const SizedBox(height: 51),
            ],
          ),
        ),
      ),
    );
  }
}
