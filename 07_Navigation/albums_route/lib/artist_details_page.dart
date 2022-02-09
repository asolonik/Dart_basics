import 'package:albums_route/models/artist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtistDetailsPage extends StatefulWidget {
  static const String routeName = '/artist_details';
  const ArtistDetailsPage({Key? key}) : super(key: key);

  @override
  State<ArtistDetailsPage> createState() => _ArtistDetailsPageState();
}

class _ArtistDetailsPageState extends State<ArtistDetailsPage> {
  Artist artist = Get.arguments[0] ?? Artist.empty();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(artist.name),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(artist.details),
            )));
  }
}
