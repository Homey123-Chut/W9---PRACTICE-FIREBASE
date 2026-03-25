import 'songs/song.dart';

class SongArtist {
  final Song song;
  final String artistName;
  final String artistGenre;
  final String artistImageUrl;
  final String duration;

  SongArtist({
    required this.song,
    required this.artistName,
    required this.artistGenre,
    required this.artistImageUrl,
    required this.duration,
  });
}
