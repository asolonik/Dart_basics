import 'package:albums_route/enums/drawer_menu.dart';
import 'package:albums_route/nav_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            drawer: const NavDrawer(
              currDrawerMenu: DrawerMenu.home,
            ),
            body: const Center(child: Text('Home View'))));
  }
}
