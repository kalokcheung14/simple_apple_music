import 'package:flutter/material.dart';

class RadioTile extends StatelessWidget {
  const RadioTile({
    Key? key,
    @required this.title,
    @required this.subtitle,
    @required this.descriptionTitle,
    @required this.descriptionSubtitle,
    @required this.imageUrl,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? descriptionTitle;
  final String? descriptionSubtitle;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title ?? "",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )
          ),
          subtitle: Text(subtitle ?? "",
              style: const TextStyle(
                fontSize: 15.0,
              )
          ),
        ),
        Container(
            width: double.maxFinite,
            height: 400,
            child: GridTile(
                child: Image.asset(
                  imageUrl ?? "",
                  fit: BoxFit.cover,
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text(
                      descriptionTitle ?? ""
                  ),
                  subtitle: Text(
                      descriptionSubtitle ?? "",
                      maxLines: 2,
                  ),
                  trailing: const Icon(Icons.play_arrow_rounded),
                )
            )
        )
      ],
    );
  }
}