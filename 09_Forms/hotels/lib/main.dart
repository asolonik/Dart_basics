import 'package:flutter/material.dart';
import 'package:hotels/hotel_details_page.dart';
import 'package:hotels/hotels_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HotelsPage.routeName,
      getPages: [
        GetPage(
            name: HotelsPage.routeName,
            page: () => HotelsPage(),
            transition: Transition.noTransition),
        GetPage(
            name: HotelDetailsPage.routeName,
            page: () => HotelDetailsPage(),
            transition: Transition.noTransition),
      ],
    );
  }
}
