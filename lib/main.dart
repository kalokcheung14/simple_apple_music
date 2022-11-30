import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_apple_music/cubits/media_cubit.dart';
import 'package:simple_apple_music/cubits/tab_cubit.dart';
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
          ),
          BlocProvider<TabCubit>(
              create: (_) => TabCubit()
          )
        ],
        child: const TabContainer(),
      ),
    );
  }
}

class TabContainer extends StatelessWidget {
  const TabContainer({Key? key}) : super (key: key);

  final List<Widget>? listScreens = const [
    RadioTab(),
    LibraryTab(),
    SearchTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      home: BlocBuilder<TabCubit, int>(
        builder: (context, index) {
          return Scaffold(
            body: IndexedStack(
              index: index,
              children: listScreens!,
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: index,
                onTap: (int index) => context.read<TabCubit>().selectTab(index),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.radio),
                    label: 'Radio',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.library_music),
                    label: 'Library',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search'
                  ),
                ]),
          );
        }
      )
    );
  }
}