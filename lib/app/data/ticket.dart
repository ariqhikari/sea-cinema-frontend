part of 'data.dart';

class Ticket {
  final String id;
  final String ticketCode;
  final String transactionId;
  final String seat;

  const Ticket({
    required this.id,
    required this.ticketCode,
    required this.transactionId,
    required this.seat,
  });

  factory Ticket.fromJson(Map<String, dynamic> data) => Ticket(
        id: data['id'],
        ticketCode: data['ticketCode'],
        transactionId: data['transactionId'],
        seat: data['seat'],
      );
}
