import 'package:simple_apple_music/models/song.dart';
import 'package:simple_apple_music/models/radio.dart';

class SampleDataHelper {
  // Singleton
  static final _instance = SampleDataHelper._internal();

  factory SampleDataHelper() {
    return _instance;
  }

  SampleDataHelper._internal();

  List<Song> getSampleSongs() {
    return [
      const Song(
          trackName: 'Hey Jude',
          artistName: 'The Beatles',
          artworkUrl: 'assets/hey_jude.jpeg'
      ),
      const Song(
          trackName: 'To All Of You',
          artistName: 'Syd Matters',
          artworkUrl: 'assets/to_all_of_you.jpg'
      ),
      const Song(
          trackName: 'Let It Be',
          artistName: 'The Beatles',
          artworkUrl: 'assets/let_it_be.jpg'
      ),
      const Song(
          trackName: 'Imagine',
          artistName: 'John Lennon',
          artworkUrl: 'assets/imagine.jpg'
      ),
      const Song(
          trackName: 'Help!',
          artistName: 'The Beatles',
          artworkUrl: 'assets/help.jpg'
      ),
    ];
  }

  List<String> getSampleCategoryList() {
    return [
      'Spatial Audio',
      'Hey Siri, Play...',
      'Cantopop',
      'K-Pop',
      'International',
      'Mandopop',
      'J-Pop',
      'Charts',
      'Anime',
      'R&B',
      'Classical',
      'Chill',
      'Hip-Hop/Rap',
      'Sleep',
      'Jazz',
      'Fitness',
      'Rock',
      'Essentials',
      'Feel Good',
      'Romance',
    ];
  }

  List<Radio> getSampleRadio() {
    return [
      const Radio(
        title: 'Music 1',
        subtitle: 'The new music that matters.',
        imageUrl: 'assets/music_1.webp',
        descriptionTitle: 'The Apple Music 1 List',
        descriptionSubtitle: 'Hear our current obsessions and new discoveries making waves.',
      ),
      const Radio(
        title: 'Music Hits',
        subtitle: 'Songs you know and love.',
        imageUrl: 'music_hit.jpg',
        descriptionTitle: 'Pure Throwback Radio',
        descriptionSubtitle: 'An amped-up time capsule from the 80s, 90s, and 2000s.',
      )
    ];
  }
}