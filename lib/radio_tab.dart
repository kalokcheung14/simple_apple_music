import 'package:flutter/material.dart';
import 'package:simple_apple_music/widgets/radio_tile.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({Key? key}) : super (key: key);

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio'),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            RadioTile(
              title: 'Music 1',
              subtitle: 'The new music that matters.',
              imageUrl: 'https://i0.wp.com/www.damusichits.com/wp-content/uploads/2019/08/The-Beats-1-List-via-Apple-Music.jpeg?w=500&ssl=1',
              descriptionTitle: 'The Apple Music 1 List',
              descriptionSubtitle: 'Hear our current obsessions and new discoveries making waves.',
            ),
            RadioTile(
              title: 'Music Hits',
              subtitle: 'Songs you know and love.',
              imageUrl: 'https://is1-ssl.mzstatic.com/image/thumb/Features115/v4/74/8f/36/748f36e4-0cd4-8ead-05c3-1374cdebe1ff/U0MtTVMtV1ctUHVyZV9UaHJvd2JhY2stQURBTV9JRD0xMzI3Nzk3NTcwLnBuZw.png/1945x1945SC.DN01.jpg?l=en-GB',
              descriptionTitle: 'Pure Throwback Radio',
              descriptionSubtitle: 'An amped-up time capsule from the 80s, 90s, and 2000s.',
            ),
          ],
        )
      )
    );
  }
}