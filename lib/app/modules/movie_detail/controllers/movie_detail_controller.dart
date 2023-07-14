import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/modules/user/user_controller.dart';
import 'package:sea_cinema_frontend/app/services/services.dart';

class MovieDetailController extends GetxController {
  final UserController userController = Get.find<UserController>();
  late Movie movie;

  @override
  void onInit() {
    super.onInit();
    movie = Get.arguments;
  }

  Future<List<Showtime>> getShowtime(String movieId) async {
    ApiReturnValue<List<Showtime>> result =
        await ShowtimeServices.showtimeById(movieId);

    if (result.value == null) {
      return [];
    }

    return result.value!;
  }
}
