import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = Uri.https('w9-database-c101d-default-rtdb.asia-southeast1.firebasedatabase.app', '/songs.json');

  @override
  Future<List<Song>> fetchSongs() async {
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      final Map<String, dynamic> songJson = json.decode(response.body) as Map<String, dynamic>;
      return songJson.keys.map((key) => SongDto.fromJson(key, Map<String, dynamic>.from(songJson[key] as Map))).toList();
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {
    final songs = await fetchSongs();
    for (final song in songs) {
      if (song.id == id) {
        return song;
      }
    }
    return null;
  }
}
