import 'package:flutter/material.dart';
import 'package:load_file/file_helper.dart';

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
  final TextEditingController _searchController = TextEditingController();
  Future<String> _data = fetchFileFromAssets('');

  OutlineInputBorder getInputBorderSettigs() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
        borderSide: BorderSide(
          color: Colors.black,
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            border: getInputBorderSettigs(),
                            enabledBorder: getInputBorderSettigs(),
                            focusedBorder: getInputBorderSettigs(),
                          ),
                        )),
                        IntrinsicHeight(
                            child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _data = fetchFileFromAssets(
                                  'assets/' + _searchController.text + '.txt');
                            });
                            if (FocusScope.of(context).hasFocus) {
                              FocusScope.of(context).unfocus();
                            }
                          },
                          child: const Text('Найти'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(7),
                                    bottomRight: Radius.circular(7)),
                              )),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: FutureBuilder(
                      future: _data,
                      builder: (context, snapshot) {
                        if (_searchController.text.isEmpty) {
                          return const Text('Введите имя файла');
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else {
                              return SingleChildScrollView(
                                child: Text(snapshot.data.toString()),
                              );
                            }
                          default:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                        }
                      },
                    ))
                  ],
                ))));
  }
}
