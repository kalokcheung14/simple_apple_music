import 'package:flutter/material.dart';
import 'controller/api_controller.dart';
import 'models/itunes_result.dart';
import 'models/store_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super (key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  static const TITLE = Text('Search');
  static const SEARCH_ICON = Icon(Icons.search);

  Widget body = const Text('search');
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
                  return Container(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                    ),
                    child: ListTile(
                      // Display leading image
                      leading: CachedNetworkImage(
                        width: 50,
                        height: 50,
                        imageUrl: artworkUrl,
                        // Placeholder for image when loading or error
                        placeholder: (context, url) => Container(width: 50, height: 50, color: Colors.grey,),
                        errorWidget: (context, url, error) => Container(width: 50, height: 50, color: Colors.grey,),
                      ),
                      // Display track name
                      title: Text(trackName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      // Display artist name as smaller text
                      subtitle: Text(subText,
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
        title = ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.white,
            size: 28,
          ),
          // Search text field
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
          ),
        );
        body = Container();
      } else {
        // Remove UI for searching if cancel icon is clicked
        appBarIcon = SEARCH_ICON;
        title = TITLE;
        body = const Text('search');
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