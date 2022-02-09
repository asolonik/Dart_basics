import 'dart:convert';

import 'package:albums_route/artist_details_page.dart';
import 'package:albums_route/enums/drawer_menu.dart';
import 'package:albums_route/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'models/artist.dart';

class ArtistsPage extends StatefulWidget {
  static const String routeName = '/albums';
  const ArtistsPage({Key? key}) : super(key: key);

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  List<Artist> artists = [];

  void getArtists() {
    rootBundle.loadString('assets/artists.json').then((value) {
      final data = json.decode(value);
      if (data != null) {
        setState(() {
          for (var item in data) {
            artists.add(Artist.fromJSON(item));
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getArtists();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            drawer: const NavDrawer(currDrawerMenu: DrawerMenu.artists),
            body: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(artists[index].name),
                  onTap: () {
                    Get.toNamed(ArtistDetailsPage.routeName,
                        arguments: [artists[index]]);
                  },
                );
              },
              itemCount: artists.length,
            )));
  }
}
