part of 'data.dart';

enum StatusTransaction { SUCCESS, CANCEL, PENDING, TOPUP, WITHDRAW }

class Transaction {
  final String id;
  final String transactionCode;
  final String userId;
  final String? showTimeId;
  final List<String>? bookingSeat;
  final int totalCost;
  final StatusTransaction status;
  final DateTime dateTime;
  final Showtime? showtime;

  const Transaction({
    required this.id,
    required this.transactionCode,
    required this.userId,
    required this.showTimeId,
    required this.bookingSeat,
    required this.totalCost,
    required this.status,
    required this.dateTime,
    this.showtime,
  });

  factory Transaction.fromJson(Map<String, dynamic> data) => Transaction(
        id: data['id'],
        transactionCode: data['transactionCode'],
        userId: data['userId'],
        showTimeId: data['showTimeId'],
        bookingSeat: data['bookingSeat'] != null
            ? (json.decode(data['bookingSeat']) as List)
                .map((item) => item as String)
                .toList()
            : [],
        totalCost: data['totalCost'],
        dateTime: data['updatedAt'] != null
            ? DateTime.parse(data['updatedAt'])
            : DateTime.now(),
        status: data['status'] == 'SUCCESS'
            ? StatusTransaction.SUCCESS
            : data['status'] == 'CANCEL'
                ? StatusTransaction.CANCEL
                : data['status'] == "TOPUP"
                    ? StatusTransaction.TOPUP
                    : data['status'] == 'WITHDRAW'
                        ? StatusTransaction.WITHDRAW
                        : StatusTransaction.PENDING,
        showtime: data['showtime'] != null
            ? Showtime.fromJson(data['showtime'])
            : null,
      );

  Transaction copyWith({
    String? transactionCode,
    String? userId,
    String? showTimeId,
    List<String>? bookingSeat,
    int? totalCost,
    StatusTransaction? status,
    DateTime? dateTime,
  }) =>
      Transaction(
        id: id,
        transactionCode: transactionCode ?? this.transactionCode,
        userId: userId ?? this.userId,
        showTimeId: showTimeId ?? this.showTimeId,
        bookingSeat: bookingSeat ?? this.bookingSeat,
        totalCost: totalCost ?? this.totalCost,
        status: status ?? this.status,
        dateTime: dateTime ?? this.dateTime,
      );
}
