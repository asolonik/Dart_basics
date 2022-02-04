import 'package:flutter/material.dart';
import 'package:material_cupertino_05/bar_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Lesson 4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _tabIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controllerBS;
  TabController? _controller;
  final List<BarItem> _tabDataList = [
    BarItem(Icons.photo, 'Photo', [
      const Center(
        child: Text('Photo Data'),
      )
    ]),
    BarItem(Icons.chat, 'Chat', [
      const Center(
        child: Text('Chat Data'),
      )
    ]),
    BarItem(Icons.album, 'Albums', [
      const Center(
        child: Text('Albums Data'),
      )
    ])
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabDataList.length, vsync: this);
    _controller?.addListener(() {
      setState(() {
        _tabIndex = _controller!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                Builder(
                  builder: (context) => IconButton(
                      onPressed: () {
                        if (!Scaffold.of(context).isEndDrawerOpen) {
                          Scaffold.of(context).openEndDrawer();
                        }
                      },
                      icon: const Icon(Icons.person)),
                ),
              ],
            ),
            drawer: Drawer(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DrawerHeader(
                        child: Image.asset(
                      'assets/avatar.png',
                    )),
                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Profile'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    const ListTile(
                      leading: Icon(Icons.image),
                      title: Text('Images'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    const ListTile(
                      leading: Icon(Icons.folder),
                      title: Text('Files'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Expanded(
                        child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.grey),
                            child: const Text('Выход'),
                            onPressed: () {},
                          ),
                          ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.grey),
                            child: const Text('Регистрация'),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ))
                  ]),
            ),
            endDrawer: Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/avatar.png',
                    height: 100,
                  ),
                  const Text('Ivan Petrov')
                ],
              ),
            ),
            floatingActionButton: Builder(
              builder: (context) => FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                        padding: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Icon(Icons.payment),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Сумма'),
                                Expanded(
                                  child: Text(
                                    '300\$',
                                    textAlign: TextAlign.end,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Оплатить'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey),
                            )
                          ],
                        )),
                  );
                },
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _tabIndex,
              items: _tabDataList.map((BarItem item) {
                return BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.text,
                );
              }).toList(),
              onTap: (index) {
                setState(() {
                  _controller?.index = index;
                  _tabIndex = index;
                });
              },
            ),
            body: TabBarView(
              controller: _controller,
              children: _tabDataList.map((BarItem item) {
                return Stack(
                  children: item.data,
                );
              }).toList(),
            )));
  }
}
