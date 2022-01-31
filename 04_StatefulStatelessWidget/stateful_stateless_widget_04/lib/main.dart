import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Part 4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, List<IconData>> titles = {
    'Мои фото': [
      Icons.ac_unit,
      Icons.access_alarm,
      Icons.access_time,
      Icons.accessibility,
      Icons.accessible_forward_outlined,
      Icons.account_box,
      Icons.account_tree_sharp,
      Icons.account_box,
      Icons.add_a_photo,
      Icons.add_chart_rounded,
      Icons.baby_changing_station,
      Icons.cabin,
      Icons.dangerous,
      Icons.e_mobiledata,
      Icons.face,
      Icons.zoom_in,
      Icons.zoom_out
    ],
    'Галерея': [
      Icons.g_mobiledata,
      Icons.ice_skating,
      Icons.h_mobiledata,
      Icons.image,
      Icons.format_align_justify,
      Icons.safety_divider,
      Icons.verified,
      Icons.radar,
      Icons.kayaking,
      Icons.padding,
      Icons.wallet_giftcard,
      Icons.qr_code,
      Icons.zoom_in,
      Icons.zoom_out,
      Icons.label,
      Icons.landscape,
      Icons.tab,
      Icons.table_chart
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: titles.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Pictures'),
            bottom: TabBar(
                tabs: titles.keys.map((String title) {
              return Tab(
                text: title,
              );
            }).toList()),
          ),
          body: TabBarView(
              children: titles.keys.map((String title) {
            return ListView(
              key: PageStorageKey(title),
              children: [
                for (var item in titles[title]!)
                  Icon(
                    item,
                    size: 96,
                  )
              ],
            );
          }).toList()),
        ));
  }
}
