import 'package:flutter/material.dart';
import 'package:simple_apple_music/widgets/title_text_style.dart';

class CustomAppBar extends AppBar {
  CustomAppBar.fromText({
    Key? key,
    required Text title,
  }): super(
    key: key,
    title: title,
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    centerTitle: false,
    titleTextStyle: const TitleTextStyle(),
  );

  CustomAppBar.fromString({
    Key? key,
    required String title,
  }): this.fromText(key: key, title: Text(title));
}