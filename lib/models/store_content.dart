class StoreContent {
  final String? wrapperType;
  final String? kind;
  final String? artistName;
  final String? trackName;
  final String? artworkUrl30;
  final String? artworkUrl60;
  final String? artworkUrl100;

  factory StoreContent.fromJson(Map<String, dynamic> json) {
    return StoreContent(
      wrapperType: json['wrapperType'],
      kind: json['kind'],
      artistName: json['artistName'],
      trackName: json['trackName'],
      artworkUrl30: json['artworkUrl30'],
      artworkUrl60: json['artworkUrl60'],
      artworkUrl100: json['artworkUrl100']
    );
  }

  StoreContent({
    this.wrapperType,
    this.kind,
    this.artistName,
    this.trackName,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100
  });
}