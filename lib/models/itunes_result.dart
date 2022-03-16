import 'store_content.dart';

class ItunesResult {
  final int? resultCount;
  final List<StoreContent>? results;

  factory ItunesResult.fromJson(Map<String, dynamic> json) {
    // Parse JSON object list to StoreContent list
    List<dynamic> resultList = json['results'] as List;
    List<StoreContent> storeContents = resultList.map(
            (content) => StoreContent.fromJson(content)
    ).toList();

    return ItunesResult(
      resultCount: json['resultCount'],
      results: storeContents,
    );
  }

  ItunesResult({
    this.resultCount,
    this.results
  });
}