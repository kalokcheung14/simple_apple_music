import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchListTile extends StatelessWidget {
  const SearchListTile({
    Key? key,
    @required this.trackName,
    @required this.artworkUrl,
    @required this.subText,
  }) : super(key: key);

  final String? artworkUrl;
  final String? trackName;
  final String? subText;

  @override
  Widget build(BuildContext context) {
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
          imageUrl: artworkUrl ?? "",
          // Placeholder for image when loading or error
          placeholder: (context, url) => Container(width: 50, height: 50, color: Colors.grey,),
          errorWidget: (context, url, error) => Container(width: 50, height: 50, color: Colors.grey,),
        ),
        // Display track name
        title: Text(trackName ?? "",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        // Display artist name as smaller text
        subtitle: Text(subText ?? "",
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),),
      ),
    );
  }
}