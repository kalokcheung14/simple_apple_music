import 'package:flutter/material.dart';
import 'controller/api_controller.dart';
import 'models/itunes_result.dart';
import 'models/store_content.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:simple_apple_music/category_list.dart';
import 'widgets/search_list_tile.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super (key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  static const TITLE = Text('Search');
  static const SEARCH_ICON = Icon(Icons.search);
  static const CAT_LIST = CategoryList();

  Widget body = CAT_LIST;
  Icon appBarIcon = SEARCH_ICON;
  Widget title = TITLE;

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
                  // Prepare the data
                  StoreContent content = contents[i];
                  String artworkUrl = content.artworkUrl60 ?? "";
                  // Use collectionName instead of trackName if it is null
                  String trackName = content.trackName ?? content.collectionName ?? "";
                  String artistName = content.artistName ?? "Unknown";
                  String kind = content.kind ?? "";
                  String subText = "";
                  // Display kind in subtext if it is not null
                  // Otherwise just display artistName
                  if (kind.isNotEmpty) {
                    subText = kind + " - " + artistName;
                  } else {
                    subText = artistName;
                  }

                  // Construct list row appearance
                  return SearchListTile(trackName: trackName, artworkUrl: artworkUrl, subText: subText);
                });
              } else {
                return const CircularProgressIndicator();
              }
            } else if (snapshot.hasError) {
              return Container();
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
        title = Row(
          children: [
          const Icon(
            Icons.search,
            color: Colors.black,
            size: 28,
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: 'Artists, Songs Lyrics and More',
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
                focusColor: Colors.black,
                border: InputBorder.none,
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
              onChanged: (text) {
                // Perform search when the text is not empty
                if (text.isNotEmpty) {
                  // Use EasyDebounce to control when to call search API
                  // Set a timer to call API 500ms after the user stop typing
                  // and cancel the call if the timer of the same name is reset
                  // so as to avoid exhausting requests whenever user input change
                  EasyDebounce.debounce(
                      'debouncer', // Name/tag of the timer
                      const Duration(milliseconds: 500),
                          () => search(text)
                  );
                }
              },
          ))
        ],);
        body = Container();
      } else {
        // Remove UI for searching if cancel icon is clicked
        appBarIcon = SEARCH_ICON;
        title = TITLE;
        body = CAT_LIST;
      }
    });
  }


  @override
  void dispose() {
    // Cancel debounce
    EasyDebounce.cancel('debouncer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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