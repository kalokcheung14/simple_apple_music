import 'package:simple_apple_music/services/media_service.dart';
import 'package:simple_apple_music/models/itunes_result.dart';

class MediaRepository {
  final MediaService _mediaService = MediaService();

  Future<ItunesResult> searchMediaList(String keyword) async {
    dynamic response = await _mediaService.search(keyword);

    return ItunesResult.fromJson(response);
  }
}