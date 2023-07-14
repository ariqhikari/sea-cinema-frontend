import 'package:get/get.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/services/services.dart';

class UserController extends GetxController {
  var user = User(name: "", username: "", age: 0, avatar: "").obs;

  Future<void> verifyToken() async {
    ApiReturnValue<User> result = await AuthServices.loadUser();

    if (result.value != null) {
      user.value = result.value!;
    }
  }
}
