import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_apple_music/cubits/media_cubit.dart';
import 'package:simple_apple_music/repositories/media_repository.dart';
import 'package:simple_apple_music/states/search_state.dart';
import 'package:simple_apple_music/library_tab.dart';
import 'package:simple_apple_music/radio_tab.dart';
import 'package:simple_apple_music/search_tab.dart';

void main() {
  // Inject repository into app
  runApp(ITunesApp(mediaRepository: MediaRepository()));
}

class ITunesApp extends StatelessWidget {
  const ITunesApp({Key? key, required MediaRepository mediaRepository})
      : _mediaRepository = mediaRepository,
        super(key: key);

  final MediaRepository _mediaRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apple Music',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        // Provide cubit with repository to sub tree
        providers: [
          BlocProvider<MediaCubit>(
              create: (_) => MediaCubit(mediaRepository: _mediaRepository)
          ),
          BlocProvider<SearchCubit>(
              create: (_) => SearchCubit()
          )
        ],
        child: const TabContainer(),
      ),
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
    // Setup for tabs
    listScreens = const [
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