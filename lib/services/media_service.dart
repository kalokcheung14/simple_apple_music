import 'service.dart';

class MediaService extends Service {
  // Call search API
  Future<dynamic> search(String keyword) async {
    // Call API endpoint
    final response = await callApi('https://itunes.apple.com/search?term=' + keyword);

    // Parse response JSON body to model
    return response;
  }
}