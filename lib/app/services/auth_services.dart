part of 'services.dart';

class AuthServices {
  static Future<ApiReturnValue<bool>> signUp(User user, String password) async {
    String url = baseURL + '/api/auth/register';

    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url))
          ..headers['Content-Type'] = 'application/json';

    var multipartFile = await http.MultipartFile.fromPath(
      'avatar',
      user.avatar,
      contentType: MediaType('avatar', user.avatar.split('.').last),
    );

    request.fields.addAll({
      'name': user.name,
      'username': user.username,
      'age': user.age.toString(),
      'password': password,
    });
    request.files.add(multipartFile);

    var response = await request.send();

    String responseBody = await response.stream.bytesToString();
    var data = jsonDecode(responseBody);

    if (response.statusCode != 201) {
      return ApiReturnValue(message: data['body']['message']);
    }

    return ApiReturnValue(
        value: true, message: 'Successfully registered an account');
  }

  static Future<ApiReturnValue<User>> signIn(
      String username, String password) async {
    http.Client client = http.Client();
    String url = baseURL + '/api/auth/login';

    var response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    } else if (data['body']['data']['user']['role'] != 'USER') {
      return ApiReturnValue(message: 'You are not User.');
    }

    String token = data['body']['data']['token'];
    saveToken(token);

    User.token = token;
    User.id = data['body']['data']['user']['id'];
    User value = User.fromJson(data['body']['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> loadUser() async {
    String? token = await getToken();

    if (token == null) {
      return ApiReturnValue(message: 'Not have token');
    }

    http.Client client = http.Client();
    String url = baseURL + '/api/auth/verify';

    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'token': token,
    });

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    User.token = token;
    User.id = data['body']['data']['user']['id'];
    User value = User.fromJson(data['body']['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> updateProfile(
      {required User user,
      String? password,
      Map<String, dynamic>? transaction}) async {
    String? token = await getToken();

    if (token == null) {
      return ApiReturnValue(message: 'Not have token');
    }

    http.Client client = http.Client();
    String url = baseURL + '/api/user/profile';

    Map<String, dynamic> body = {
      "name": user.name,
      "age": user.age,
      "balance": user.balance
    };

    if (password != null) {
      body['password'] = password;
    }

    if (transaction != null) {
      body['transaction'] = transaction['transaction'];
      body['totalCost'] = transaction['totalCost'];
    }

    var response = await client.patch(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'token': token,
      },
      body: jsonEncode(body),
    );

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    User.id = data['body']['data']['user']['id'];
    User value = User.fromJson(data['body']['data']['user']);

    return ApiReturnValue(value: value);
  }

  static void signOut() async {
    removeToken();
  }
}
