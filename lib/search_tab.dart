import 'package:flutter/material.dart';
import 'controller/api_controller.dart';
import 'models/itunes_result.dart';
import 'models/store_content.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super (key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  Widget body = const Text('search');
  Icon appBarIcon = const Icon(Icons.search);
  Widget title = const Text('Search');

  void search(String text) {
    setState(() {
      // Pass the text to the API for searching
      // and expect future returns
      body = FutureBuilder<ItunesResult>(
        future: ApiController().search(text),
        builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              List<StoreContent>? contents = snapshot.data!.results;

              if (contents != null) {
                return ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: contents.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  // Construct list row appearance
                  return Container(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                    ),
                    child: ListTile(
                      leading: CachedNetworkImage(
                        width: 50,
                        height: 50,
                        imageUrl: contents[i].artworkUrl60 ?? "",
                        placeholder: (context, url) => Container(width: 50, height: 50, color: Colors.grey,),
                        errorWidget: (context, url, error) => Container(width: 50, height: 50, color: Colors.grey,),
                      ),
                      title: Text(contents[i].trackName ?? "",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      subtitle: Text(contents[i].artistName!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),),
                    ),
                  );
                });
              } else {
                return const CircularProgressIndicator();
              }
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
      );
    });
  }

  void toggleSearchBar() {
    setState(() {
      // Determine whether search button or cancel button is clicked
      // by checking the current icon displayed
      if (appBarIcon.icon == Icons.search) {
        // Display UI for searching if search icon is clicked
        appBarIcon = const Icon(Icons.cancel);
        title = ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.white,
            size: 28,
          ),
          title: TextField(
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              hintText: 'Artists, Songs Lyrics and More',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              focusColor: Colors.white,
              border: InputBorder.none,
            ),
            style: const TextStyle(
              color: Colors.white,
            ),
            onChanged: (text) {
              if (text.isNotEmpty) {
                // Perform search when the text is not empty
                search(text);
              }
            },
          ),
        );
        body = const Text('searching');
      } else {
        // Remove UI for searching if cancel icon is clicked
        appBarIcon = const Icon(Icons.search);
        title = const Text('Search');
        body = const Text('search');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: toggleSearchBar,
            icon: appBarIcon,
          ),
        ],
        centerTitle: false,
      ),
      body: Center(child: body)
    );
  }
}