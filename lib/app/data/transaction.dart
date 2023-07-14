part of 'data.dart';

enum StatusTransaction { SUCCESS, CANCEL, PENDING, TOPUP, WITHDRAW }

class Transaction {
  final String id;
  final String transactionCode;
  final String userId;
  final String showTimeId;
  final List<String> bookingSeat;
  final int totalCost;
  final StatusTransaction status;

  const Transaction({
    required this.id,
    required this.transactionCode,
    required this.userId,
    required this.showTimeId,
    required this.bookingSeat,
    required this.totalCost,
    required this.status,
  });

  factory Transaction.fromJson(Map<String, dynamic> data) => Transaction(
        id: data['id'],
        transactionCode: data['transactionCode'],
        userId: data['userId'],
        showTimeId: data['showTimeId'],
        bookingSeat: data['bookingSeat'],
        totalCost: data['totalCost'],
        status: data['status'],
      );

  Transaction copyWith({
    String? transactionCode,
    String? userId,
    String? showTimeId,
    List<String>? bookingSeat,
    int? totalCost,
    StatusTransaction? status,
  }) =>
      Transaction(
        id: id,
        transactionCode: transactionCode ?? this.transactionCode,
        userId: userId ?? this.userId,
        showTimeId: showTimeId ?? this.showTimeId,
        bookingSeat: bookingSeat ?? this.bookingSeat,
        totalCost: totalCost ?? this.totalCost,
        status: status ?? this.status,
      );
}
