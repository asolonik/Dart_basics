import 'package:albums_route/artists_page.dart';
import 'package:albums_route/enums/drawer_menu.dart';
import 'package:albums_route/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key, required DrawerMenu this.currDrawerMenu})
      : super(key: key);
  final DrawerMenu currDrawerMenu;

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text('Home', style: TextStyle(fontSize: 17)),
                selected: widget.currDrawerMenu == DrawerMenu.home,
                onTap: () {
                  if (widget.currDrawerMenu == DrawerMenu.home) return;
                  Get.toNamed(HomePage.routeName);
                },
              ),
              ListTile(
                title: const Text('Artists', style: TextStyle(fontSize: 17)),
                selected: widget.currDrawerMenu == DrawerMenu.artists,
                onTap: () {
                  if (widget.currDrawerMenu == DrawerMenu.artists) return;
                  Get.toNamed(ArtistsPage.routeName);
                },
              )
            ],
          ),
        ));
  }
}
