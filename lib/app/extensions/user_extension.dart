part of 'extensions.dart';

extension UserExtension on User {
  String get getUrlAvatar {
    return "$baseURL/avatars/${this.avatar}";
  }
}
