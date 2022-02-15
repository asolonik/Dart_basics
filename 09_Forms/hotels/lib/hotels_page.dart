import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotels/hotel_details_page.dart';
import 'package:hotels/models/hotel.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'enums/list_view.dart';

class HotelsPage extends StatefulWidget {
  static const String routeName = '/hotels';
  HotelsPage({Key? key}) : super(key: key);

  @override
  State<HotelsPage> createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  List<Hotel> hotels = [];
  bool isLoading = false;
  bool hasError = false;
  ListViewType listViewType = ListViewType.list;
  double borderRadius = 10;

  void getHotels() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });
    try {
      var response = await http.get(Uri.parse(
          'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301'));
      var data = json.decode(response.body);
      hotels = data.map<Hotel>((hotel) => Hotel.fromJson(hotel)).toList();
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getHotels();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        listViewType = ListViewType.list;
                      });
                    },
                    icon: const Icon(Icons.list_sharp)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        listViewType = ListViewType.tiles;
                      });
                    },
                    icon: const Icon(Icons.grid_view_sharp))
              ],
            ),
            body: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : buildHotelList()));
  }

  Widget buildHotelList() {
    switch (listViewType) {
      case ListViewType.tiles:
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5, mainAxisExtent: 230),
          itemBuilder: (context, index) {
            return buildHotelGridItem(hotels[index]);
          },
          itemCount: hotels.length,
        );
      default:
        return ListView.builder(
          itemBuilder: (context, index) {
            return buildHotelListItem(hotels[index]);
          },
          itemCount: hotels.length,
        );
    }
  }

  Widget buildHotelGridItem(Hotel hotel) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius)),
                child: Image.asset(
                  'assets/photo.jpg',
                  width: double.infinity,
                )),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: Text(
              hotel.name!,
              textAlign: TextAlign.center,
            )),
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(borderRadius),
                    bottomRight: Radius.circular(borderRadius)),
                child: GestureDetector(
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          'Подробнее',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  onTap: () {
                    Get.toNamed(HotelDetailsPage.routeName, arguments: [hotel]);
                  },
                ))
          ],
        ));
  }

  Widget buildHotelListItem(Hotel hotel) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius)),
            child: Image.asset(
              'assets/photo.jpg',
              width: double.infinity,
              //fit: BoxFit.fill,
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(child: Text(hotel.name!)),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(HotelDetailsPage.routeName,
                          arguments: [hotel]);
                    },
                    child: const Text('Подробнее'))
              ],
            ))
      ]),
    );
  }
}
