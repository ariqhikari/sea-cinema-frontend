import 'package:get/get.dart';

import '../controllers/recent_transaction_controller.dart';

class RecentTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecentTransactionController>(
      () => RecentTransactionController(),
    );
  }
}
