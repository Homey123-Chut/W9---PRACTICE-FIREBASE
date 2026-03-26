import 'package:flutter/material.dart';

import 'package:w9/model/song_artist.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.item,
    required this.isPlaying,
    required this.onTap,
  });

  final SongArtist item;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(item.artist.imageUrl),
            
          ),
          title: Text(item.song.title),
          subtitle: Text('${item.song.duration.inMinutes} mn   ${item.artist.name} –  ${item.artist.genre}'),

          trailing: Text(
                isPlaying ? "Playing" : "",
                style: TextStyle(color: Colors.amber),
              ),
        ),
      ),
    );
  }
}
