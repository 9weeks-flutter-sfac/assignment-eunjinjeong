import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  const MusicTile(
      {super.key,
      required this.title,
      required this.artist,
      required this.image});

  final String title;
  final String artist;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(4), child: Image.asset(image)),
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Row(
        children: [
          const Icon(
            Icons.check_circle,
            size: 15,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              artist,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
