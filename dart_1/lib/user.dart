class User {
  String email;

  User(String email) {
    var emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      this.email = email;
    } else {
      throw ArgumentError('Invalid email');
    }
  }
}

mixin UserHelper on User {
  String getMailSystem() {
    try {
      return email.split('@')[1];
    } on Exception catch (_) {
      throw ArgumentError('Invalid email');
    }
  }
}
