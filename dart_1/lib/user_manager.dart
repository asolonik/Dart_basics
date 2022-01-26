import 'package:dart_1/admin_user.dart';
import 'package:dart_1/general_user.dart';
import 'package:dart_1/user.dart';

class UserManager<T extends User> {
  final List<T> _users = [];

  void add(T) {
    _users.add(T);
  }

  void remove(T) {
    _users.remove(T);
  }

  List<String> getUserList() {
    var result = <String>[];
    for (var user in _users) {
      if (user is AdminUser) result.add(user.getMailSystem());
      if (user is GeneralUser) result.add(user.email);
    }
    return result;
  }
}
