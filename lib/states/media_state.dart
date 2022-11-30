import 'package:flutter/cupertino.dart';
import 'package:simple_apple_music/models/itunes_result.dart';

@immutable
abstract class MediaState {}

class MediaClear extends MediaState {}

class MediaInitial extends MediaState {}

class MediaLoaded extends MediaState {
  final ItunesResult itunesResult;

  MediaLoaded({required this.itunesResult});
}

class MediaError extends MediaState {
  final String message;

  MediaError({required this.message});
}
