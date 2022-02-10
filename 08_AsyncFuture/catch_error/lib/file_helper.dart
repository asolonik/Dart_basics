import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String fileName) async {
  try {
    return await rootBundle.loadString(fileName, cache: false);
  } catch (_) {
    return 'файл не найден';
  }
}
