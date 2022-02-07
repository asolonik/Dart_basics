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
  OutlineInputBorder getInputBorderSettigs() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.purple,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          border: getInputBorderSettigs(),
                          enabledBorder: getInputBorderSettigs(),
                          focusedBorder: getInputBorderSettigs(),
                          labelText: 'Search',
                          labelStyle: const TextStyle(color: Colors.purple),
                          hintText: 'Введите значение',
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (FocusScope.of(context).hasFocus) {
                                FocusScope.of(context).unfocus();
                              }
                            },
                            icon: const Icon(Icons.search),
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Поле для поиска заметок',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ]))));
  }
}
