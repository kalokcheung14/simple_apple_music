import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_apple_music/repositories/media_repository.dart';
import 'package:simple_apple_music/states/media_state.dart';

class MediaCubit extends Cubit<MediaState> {
  // Display empty container at the beginning
  MediaCubit({required this.mediaRepository}): super(MediaClear());

  final MediaRepository mediaRepository;

  // Beginning state
  void clear() {
    emit(MediaClear());
  }

  void search(String keyword) async {
    try {
      // Loading
      emit(MediaInitial());

      // Call API
      mediaRepository.searchMediaList(keyword).then((media) {
        // API Result
        emit(MediaLoaded(itunesResult: media));
      });
    } catch (e) {
      // Error
      emit(MediaError(message: e.toString()));
    }
  }
}