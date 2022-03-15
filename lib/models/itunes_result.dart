import 'store_content.dart';

class ItunesResult {
  final int? resultCount;
  final List<StoreContent>? results;

  factory ItunesResult.fromJson(Map<String, dynamic> json) {
    List<StoreContent> results = (json['results'] as List).map((content) => StoreContent.fromJson(content)).toList();

    return ItunesResult(
      resultCount: json['resultCount'],
      results: results,
    );
  }

  ItunesResult({
    this.resultCount,
    this.results
  });
}