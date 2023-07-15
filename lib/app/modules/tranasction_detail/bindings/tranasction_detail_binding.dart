import 'package:get/get.dart';

import '../controllers/tranasction_detail_controller.dart';

class TranasctionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TranasctionDetailController>(
      () => TranasctionDetailController(),
    );
  }
}
