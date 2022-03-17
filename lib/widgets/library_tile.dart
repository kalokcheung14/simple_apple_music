import 'package:flutter/material.dart';

class LibraryTile extends StatelessWidget {
  const LibraryTile({
    Key? key,
    @required this.trackName,
    @required this.artistName,
    @required this.artworkUrl,
  }) : super(key: key);

  final String? trackName;
  final String? artistName;
  final String? artworkUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridTile(
        child: Column(
          children: [
            Image.asset(
              artworkUrl ?? "",
              width: double.maxFinite,
              fit: BoxFit.fitWidth,
              height: 150,
            ),
            Container(
              padding: const EdgeInsets.only(top: 5.0),
              alignment: Alignment.centerLeft,
              child: Text(trackName ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 13.0
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5.0),
              alignment: Alignment.centerLeft,
              child: Text(artistName ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 13.0,
                    color: Colors.grey
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}