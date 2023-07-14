import 'package:get/get.dart';

import '../controllers/seats_controller.dart';

class SeatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeatsController>(
      () => SeatsController(),
    );
  }
}
