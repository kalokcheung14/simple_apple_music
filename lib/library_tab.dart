import 'package:flutter/material.dart';

class LibraryTab extends StatefulWidget {
  const LibraryTab({Key? key}) : super (key: key);

  @override
  State<LibraryTab> createState() => _LibraryTabState();
}

class _LibraryTabState extends State<LibraryTab> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Library'),
      ),
    );
  }
}