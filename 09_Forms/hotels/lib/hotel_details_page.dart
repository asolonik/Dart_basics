import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:get/get.dart';
import 'package:hotels/models/hotel_details.dart';
import 'package:http/http.dart' as http;

class HotelDetailsPage extends StatefulWidget {
  static const String routeName = '/hotel_details';
  HotelDetailsPage({Key? key}) : super(key: key);

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  Hotel hotel = Get.arguments[0] as Hotel;
  late HotelDetails hotelDetails = HotelDetails.empty();
  bool isLoading = false;
  bool hasError = false;

  void getHotelDetails() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });
    try {
      var response =
          await http.get(Uri.parse('https://run.mocky.io/v3/${hotel.uuid}'));
      var data = json.decode(response.body);
      if (data['message'] == null) {
        hotelDetails = HotelDetails.fromJson(data);
      } else {
        setState(() {
          hasError = true;
        });
        hotelDetails.message = data['message'];
      }
    } catch (e) {
      setState(() {
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
    getHotelDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(hotel.name!),
              centerTitle: true,
            ),
            body: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : hasError
                    ? Center(
                        child: Text(hotelDetails.message),
                      )
                    : buildHotelDetails()));
  }

  Widget buildHotelDetails() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CarouselSlider(
        options: CarouselOptions(),
        items: hotelDetails.photos
            .map((item) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(child: Image.asset('assets/photo.jpg'))))
            .toList(),
      ),
      Expanded(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getRichText('Страна: ', hotelDetails.address.country),
            getRichText('Город: ', hotelDetails.address.city),
            getRichText('Улица: ', hotelDetails.address.street),
            getRichText('Рейтинг: ', '${hotelDetails.rating}'),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Сервисы',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Expanded(
                  flex: 1,
                  child: Text('Платные', style: TextStyle(fontSize: 17)),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Бесплатные',
                    style: TextStyle(fontSize: 17),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: hotelDetails.services.paid
                            .map((service) => Text(service))
                            .toList())),
                Expanded(
                    flex: 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: hotelDetails.services.free
                            .map((service) => Text(service))
                            .toList()))
              ],
            )
          ],
        ),
      ))
    ]);
  }

  Widget getRichText(String title, String boldText) {
    if (boldText.isEmpty) return const SizedBox();
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: title),
          TextSpan(
            text: boldText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
