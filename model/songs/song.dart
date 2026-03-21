class Song {
  final String id;
  final String title;
  final String artistId;
  final Duration duration;
  final String imageUrL;

  Song({
    required this.id,
    required this.title,
    required this.artistId,
    required this.duration,
    required this.imageUrL,
  });

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist: $artistId, duration: $duration)';
  }
}
