import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_apple_music/cubits/media_cubit.dart';
import 'package:simple_apple_music/states/media_state.dart';
import 'package:simple_apple_music/states/search_state.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // Cancel debounce
    EasyDebounce.cancel('debouncer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: BlocBuilder<SearchCubit, bool>(
            builder: (context, isSearch) {
              // Toggle search state
              if (isSearch) {
                return Row(
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
                            color: Colors.black,
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
                                      () => context.read<MediaCubit>().search(text)
                              );
                            }
                          },
                        ))
                  ],);
              } else {
                return TITLE;
              }
            },
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              iconSize: 30,
              // Toggle search state when search icon is pressed
              onPressed: () => context.read<SearchCubit>().toggle(),
              icon: BlocBuilder<SearchCubit, bool>(
                builder: (context, isSearch) {
                  if (isSearch) {
                    return const Icon(Icons.cancel);
                  } else {
                     return SEARCH_ICON;
                  }
                },
              ),
            ),
          ],
          centerTitle: false,
        ),
        body: Center(child: BlocBuilder<SearchCubit, bool>(
          builder: (context, isSearch) {
            if (isSearch) {
              return BlocBuilder<MediaCubit, MediaState>(builder: (context, state) {
                if (state is MediaInitial) {
                  return const CircularProgressIndicator();
                } else if (state is MediaLoaded) {
                  final result = state.itunesResult;
                  List<StoreContent>? contents = result.results;

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
                          String trackName = content.trackName ??
                              content.collectionName ?? "";
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
                          return SearchListTile(trackName: trackName,
                              artworkUrl: artworkUrl,
                              subText: subText);
                        });
                  } else {
                    return Container();
                  }
                } else {
                  return Container();
                }
              });
            } else {
              return CAT_LIST;
            }
          },
        ))
    );
  }
}