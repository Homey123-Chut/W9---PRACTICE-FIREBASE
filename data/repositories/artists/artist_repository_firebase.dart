
import '../../../data/dtos/artist_dto.dart';
import '../../../model/artists/artist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../artists/artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistUri = Uri.https('w9-database-c101d-default-rtdb.asia-southeast1.firebasedatabase.app', '/artists.json');

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of artists
      final Map<String, dynamic> artistJson = json.decode(response.body) as Map<String, dynamic>;
      final List<Artist> artists = [];
      artistJson.forEach((key, value) {
      artists.add(ArtistDto.fromJson(key, Map<String, dynamic>.from(value)));
      });
      return artists;
    } 
    else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load Artists');
    }
  }
}