import 'package:flutter/material.dart';
import 'package:flutter_menu_list/flutter_menu_list.dart';
import 'package:simple_apple_music/widgets/custom_app_bar.dart';
import 'package:simple_apple_music/widgets/title_text_style.dart';
import 'widgets/library_tile.dart';
import 'models/song.dart';
import 'helpers/sample_data_helper.dart';

class LibraryTab extends StatefulWidget {
  const LibraryTab({Key? key}) : super (key: key);

  @override
  State<LibraryTab> createState() => _LibraryTabState();
}

class _LibraryTabState extends State<LibraryTab> {
  static final songs = SampleDataHelper().getSampleSongs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.fromString(title: "Library"),
      body: Center(
        child: SingleChildScrollView(child: Column(
          children: [
            // Option Menu
            MenuListContainer(sections: [
              MenuListSection(title: Container(),
                menus: const [
                  MenuListContent(title: Text('Playlists')),
                  MenuListContent(title: Text('Artists')),
                  MenuListContent(title: Text('Albums')),
                  MenuListContent(title: Text('Songs')),
                  MenuListContent(title: Text('Genres')),
                  MenuListContent(title: Text('Compilations')),
                  MenuListContent(title: Text('Composers')),
                ])
            ]),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 25.0, top: 12.0, bottom: 12.0, right: 8.0),
              alignment: Alignment.centerLeft,
              child: const Text('Recently Added',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)
            ),
            Container(
              color: Colors.white,
              child: GridView.count(
                childAspectRatio: 4/5.3,
                padding: const EdgeInsets.only(left: 20, right: 20),
                // Disable scrolling
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                children: List.generate(songs.length, (index) {
                  Song song = songs[index];

                  // Display a song details using LibraryTile
                  return LibraryTile(
                    trackName: song.trackName,
                    artistName: song.artistName,
                    artworkUrl: song.artworkUrl,
                  );
                },),
              ),
            )
          ],
        )),
      ),
    );
  }
}