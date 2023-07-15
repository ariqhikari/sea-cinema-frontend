part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<bool>> createTransaction(
      Transaction transaction) async {
    String? token = await getToken();

    if (token == null) {
      return ApiReturnValue(message: 'Not have token');
    }

    http.Client client = http.Client();
    String url = baseURL + '/api/transactions';

    var response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'token': token,
      },
      body: jsonEncode(<String, dynamic>{
        'userId': transaction.userId,
        'showTimeId': transaction.showTimeId,
        'totalCost': transaction.totalCost,
        'bookingSeat': transaction.bookingSeat,
      }),
    );

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    return ApiReturnValue(
        value: true, message: 'Successfully created an transaction');
  }

  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    String? token = await getToken();

    if (token == null) {
      return ApiReturnValue(message: 'Not have token');
    }

    http.Client client = http.Client();
    String url = baseURL + '/api/transactions';

    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'token': token,
    });

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    List<Transaction> transactions =
        (data['body']['data']['transactions'] as Iterable)
            .map((transaction) => Transaction.fromJson(transaction))
            .toList();

    return ApiReturnValue(value: transactions);
  }

  static Future<ApiReturnValue<bool>> cancelBooking(String id) async {
    String? token = await getToken();

    if (token == null) {
      return ApiReturnValue(message: 'Not have token');
    }

    http.Client client = http.Client();
    String url = baseURL + '/api/transactions/$id/cancel';

    var response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'token': token,
      },
    );

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    return ApiReturnValue(value: true, message: 'Successfully cancel booking');
  }
}
