import 'package:flutter/material.dart';
import 'package:simple_apple_music/widgets/radio_tile.dart';
import 'helpers/sample_data_helper.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({Key? key}) : super (key: key);

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  static final radioList = SampleDataHelper().getSampleRadio();

  @override
  Widget build(BuildContext context) {
    List<RadioTile> tiles = <RadioTile>[];
    for (var radio in radioList) {
      tiles.add(RadioTile(
        title: radio.title,
        subtitle: radio.subtitle,
        imageUrl: radio.imageUrl,
        descriptionTitle: radio.descriptionTitle,
        descriptionSubtitle: radio.descriptionSubtitle,
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: tiles,
          )
        )
      )
    );
  }
}