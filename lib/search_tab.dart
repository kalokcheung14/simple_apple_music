import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super (key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  Icon appBarIcon = const Icon(Icons.search);
  Widget title = const Text('Search');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              setState(() {
                if (appBarIcon.icon == Icons.search) {
                  appBarIcon = const Icon(Icons.cancel);
                  title = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Artists, Songs Lyrics and More',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        focusColor: Colors.white,
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  appBarIcon = const Icon(Icons.search);
                  title = const Text('Search');
                }
              });
            },
            icon: appBarIcon,
          ),
        ],
        centerTitle: false,
      ),
      body: const Center(
        child: Text('search'),
      ),
    );
  }
}