import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Color getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }

  List<int> _data = List.generate(50, (index) {
    return index;
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        double _width = constraints.constrainWidth();
        return _width < 500
            ? SizedBox(
                height: 100,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1,
                    mainAxisSpacing: 40,
                    mainAxisExtent: 100,
                  ),
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Container(
                      decoration: BoxDecoration(color: getRandomColor()),
                    ));
                  },
                ))
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(color: getRandomColor()),
                      ));
                },
                itemCount: _data.length);
      },
    )));
  }
}
