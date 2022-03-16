import 'package:flutter/material.dart';
import 'package:simple_apple_music/library_tab.dart';
import 'package:simple_apple_music/radio_tab.dart';
import 'package:simple_apple_music/search_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apple Music',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const TabContainer(),
    );
  }
}

class TabContainer extends StatefulWidget {
  const TabContainer({Key? key}) : super (key: key);

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int tabIndex = 0;
  List<Widget>? listScreens;

  @override
  void initState() {
    super.initState();
    listScreens = [
      LibraryTab(),
      RadioTab(),
      SearchTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      home: Scaffold(
        body: IndexedStack(
            index: tabIndex,
            children: listScreens!,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabIndex,
            onTap: (int index) {
              setState(() {
                tabIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: 'Library',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.radio),
                label: 'Radio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search'
              ),
            ]),
        ));
  }
}