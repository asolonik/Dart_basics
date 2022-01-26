import 'package:dart_1/admin_user.dart';
import 'package:dart_1/delimeters_calc.dart' as delimeters_calc;
import 'package:dart_1/general_user.dart';
import 'package:dart_1/num_helper.dart';
import 'package:dart_1/point.dart';
import 'package:dart_1/string_ext.dart';
import 'package:dart_1/list_ext.dart';
import 'package:dart_1/num_ext.dart';
import 'package:dart_1/user_manager.dart';

void main(List<String> arguments) {
  var calc = delimeters_calc.DelimetersCalculator();
  print('Greatest Common Divisor: ${calc.calcGCD(12, 30)}');
  print('Least Common Multiple: ${calc.calcLCM(12, 30)}');

  print('Dec to Bin: ${NumHelper.DecToBin(30)}');
  print('Bin to Dec: ${NumHelper.BinToDec(11110)}');

  var str = 'Hello 1 and 2.0 world 5';
  print('Str to num list: ${str.toNumList()}');

  var wordList = ['hello', 'world', 'hello', 'hi', 'dart', 'hello', 'hi'];
  print('List to Map: ${wordList.toMapWithCnt()}');

  var strList = [
    'one, two, cat, dog, three',
    'one, two, zero, zero',
    'nine, hello, hi, one, word'
  ];
  for (var str in strList) {
    print('Int in \'$str\': ${str.toSetOfInt()}');
  }

  var mainPoint = Point(10, 10, 10);
  print('Distance to zero point: ${mainPoint.distanceTo(Point.zero())}');

  var num1 = 4;
  var num2 = 32;
  print('Num power: ${num1.pow(3)}');
  print('Num root: ${num2.root(5)}');

  var userManager = UserManager();
  userManager.add(GeneralUser('u1@email.ru'));
  var googleUser = GeneralUser('u2@google.com');
  userManager.add(googleUser);
  userManager.add(AdminUser('admin@super.ru'));
  userManager.add(GeneralUser('u3@bk.ru'));

  print('User list: ${userManager.getUserList()}');

  userManager.remove(googleUser);
  print('User list after remove: ${userManager.getUserList()}');
}
