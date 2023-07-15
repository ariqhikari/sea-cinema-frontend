part of 'data.dart';

class User {
  static String? id;
  final String name;
  final String username;
  final int age;
  final String avatar;
  final int balance;
  final String role;
  static String? token;

  const User({
    required this.name,
    required this.username,
    required this.age,
    required this.avatar,
    this.balance = 0,
    this.role = "USER",
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        name: data['name'],
        username: data['username'],
        age: data['age'],
        balance: data['balance'],
        avatar: data['avatar'],
        role: data['role'],
      );

  User copyWith({
    String? name,
    int? age,
    String? avatar,
    int? balance,
    String? role,
  }) =>
      User(
        name: name ?? this.name,
        username: username,
        age: age ?? this.age,
        avatar: avatar ?? this.avatar,
        balance: balance ?? this.balance,
        role: role ?? this.role,
      );
}
