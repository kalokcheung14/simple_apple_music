import 'package:flutter/material.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({Key? key}) : super (key: key);

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('radio'),
      ),
    );
  }
}