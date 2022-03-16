import 'package:flutter/material.dart';
import 'package:flutter_menu_list/flutter_menu_list.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LibraryTab extends StatefulWidget {
  const LibraryTab({Key? key}) : super (key: key);

  @override
  State<LibraryTab> createState() => _LibraryTabState();
}

class _LibraryTabState extends State<LibraryTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        centerTitle: false,
      ),
      body: Center(
        child: SingleChildScrollView(child: Column(
          children: [
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
              padding: const EdgeInsets.only(left: 20, right: 20),
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              children: List.generate(20, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridTile(
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: 'https://is5-ssl.mzstatic.com/image/thumb/Music3/v4/31/fd/66/31fd6612-13d8-424e-744f-d6f5bec14ce4/source/60x60bb.jpg',
                          width: double.maxFinite,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                );
              },),
            ),
          ],
        )),
      ),
    );
  }
}