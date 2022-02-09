import 'package:albums_route/artist_details_page.dart';
import 'package:albums_route/artists_page.dart';
import 'package:albums_route/home_page.dart';
import 'package:albums_route/size_transition.dart';
import 'package:flutter/material.dart';
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
      initialRoute: HomePage.routeName,
      getPages: [
        GetPage(
            name: HomePage.routeName,
            page: () => const HomePage(),
            transition: Transition.noTransition),
        GetPage(
            name: ArtistsPage.routeName,
            page: () => const ArtistsPage(),
            transition: Transition.noTransition),
        GetPage(
            name: ArtistDetailsPage.routeName,
            page: () => ArtistDetailsPage(),
            transitionDuration: const Duration(seconds: 1),
            customTransition: SizeTransitions()),
      ],
    );
  }
}
