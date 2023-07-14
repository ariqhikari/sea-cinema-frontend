import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/modules/user/user_controller.dart';
import 'package:sea_cinema_frontend/app/services/services.dart';

class HomeController extends GetxController {
  final UserController userController = Get.find<UserController>();
  final CarouselController carouselController = CarouselController();
  RxInt current = 0.obs;

  Future<List<Movie>> getNowPlaying() async {
    ApiReturnValue<List<Movie>> result = await MovieServices.nowPlaying();

    if (result.value == null) {
      return [];
    }

    return result.value!;
  }

  Future<List<Movie>> getMovieByGenre(String genre) async {
    ApiReturnValue<List<Movie>> result =
        await MovieServices.movieByGenre(genre);

    if (result.value == null) {
      return [];
    }

    return result.value!;
  }
}
