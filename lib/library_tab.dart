import 'package:flutter/material.dart';
import 'package:flutter_menu_list/flutter_menu_list.dart';
import 'widgets/library_tile.dart';
import 'models/song.dart';

class LibraryTab extends StatefulWidget {
  const LibraryTab({Key? key}) : super (key: key);

  @override
  State<LibraryTab> createState() => _LibraryTabState();
}

class _LibraryTabState extends State<LibraryTab> {
  static const songs = [
    Song(trackName: 'Hey Jude', artistName: 'The Beatles', artworkUrl: 'https://i.discogs.com/cZ0OOuKA6B8x8a-Ma19XYF8mH1nf7UMpWAJbfqVjK0M/rs:fit/g:sm/q:90/h:599/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ0ODM3/OS0xNDE2NDE3NDM4/LTk2NzguanBlZw.jpeg'),
    Song(trackName: 'To All Of You', artistName: 'Syd Matters', artworkUrl: 'https://i.discogs.com/ETHMGVIBDtrTW-n606wXh9i2MpqA2CgpbLAc2mz4O4A/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE4ODY4/MzgtMTYyOTYwOTAw/MC02MjUwLmpwZWc.jpeg'),
    Song(trackName: 'Let It Be', artistName: 'The Beatles', artworkUrl: 'https://i.discogs.com/HWA3uoT2xu7zj_kM-f18f02CCQNKk2W8YzUL-D_l2ZM/rs:fit/g:sm/q:90/h:581/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwODgx/MjYtMTI1Njk1MDk3/OS5qcGVn.jpeg'),
    Song(trackName: 'Imagine', artistName: 'John Lennon', artworkUrl: 'https://i.discogs.com/E9By3756jApYIWR6WQSbA13Hs4bDELd7GkHrTUmb_TI/rs:fit/g:sm/q:90/h:600/w:580/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTM4Mjg3/Ny0xMzI3OTMzOTkx/LmpwZWc.jpeg'),
    Song(trackName: 'Help!', artistName: 'The Beatles', artworkUrl: 'https://i.discogs.com/wyiiDpeIjMSdlkjX6At93SVQxYNzUkVooD7krBZrg0s/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTczNTU2/NC0xNjIyMDU0OTY0/LTE3MjkuanBlZw.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Library'),
        centerTitle: false,
      ),
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
              padding: const EdgeInsets.only(left: 25.0, top: 12.0, bottom: 12.0, right: 8.0),
              alignment: Alignment.centerLeft,
              child: const Text('Recently Added',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)
            ),
            GridView.count(
              childAspectRatio: 4/5,
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
          ],
        )),
      ),
    );
  }
}