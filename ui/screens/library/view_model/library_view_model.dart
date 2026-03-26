import 'package:flutter/material.dart';
import 'package:w9/data/repositories/artists/artist_repository.dart';
import 'package:w9/model/song_artist.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';
import '../../../utils/async_value.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  final ArtistRepository artistRepository;

  AsyncValue<List<SongArtist>> songsValue = AsyncValue.loading();

  LibraryViewModel({
    required this.songRepository,
    required this.playerState,
    required this.artistRepository,
  }) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    fetchSong();
  }

  void fetchSong() async {
    // 1- Loading state
    songsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      List<Song> songs = await songRepository.fetchSongs();
      final artists = await artistRepository.fetchArtists();

      final artistById = {
        for (final artist in artists) artist.id: artist,
      };

      final List<SongArtist> joined = [];

      for (final song in songs) {
        final artist = artistById[song.artistId]!;
        final SongArtist item = SongArtist(
          song: song,
          artist: artist,
        );

        joined.add(item);
      }

      songsValue = AsyncValue.success(joined);
    } catch (e) {
      // 3- Fetch is unsucessfull
      songsValue = AsyncValue.error(e);
    }
    notifyListeners();

  }

  bool isSongPlaying(SongArtist item) => playerState.currentSong == item.song;

  void start(SongArtist item) => playerState.start(item.song);
  void stop() => playerState.stop();
}
