import 'dart:math';

class NumHelper {
  static int DecToBin(int dec) {
    var result = 0;
    var i = 1;

    while (dec > 0) {
      result = result + (dec % 2) * i;
      dec = (dec / 2).floor();
      i = i * 10;
    }
    return result;
  }

  static int BinToDec(int bin) {
    var result = 0;
    var i = 0;
    var temp = bin;

    while (temp > 0) {
      var lastDigit = temp % 10;
      temp = temp ~/ 10;
      result += lastDigit * (pow(2, i));
      i++;
    }

    return result;
  }
}
