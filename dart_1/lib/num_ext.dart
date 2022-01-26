extension NumExt on num {
  bool get isInt => (this % 1) == 0;

  num pow(num powValue) {
    if (powValue == 0) {
      return 1;
    }

    if (powValue % 2 == 0) {
      var p = pow(powValue / 2);
      return p * p;
    } else {
      return this * pow(powValue - 1);
    }
  }

  num root(num pow) {
    num x = 1;
    for (var i = 0; i < 1000; i++) {
      if (x == (x = 1.0 / pow * (((pow - 1) * x) + (this / x.pow(pow - 1))))) {
        break;
      }
    }
    if (x.isInt) {
      return x;
    } else {
      throw ArgumentError('Invalid pow value');
    }
  }
}
