import 'package:assignment/widgets/postbottom_sheet.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class postCard extends StatelessWidget {
  const postCard({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(post.id.toString()),
      ),
      title: Text(post.title),
      subtitle: Text(post.body),
      onTap: () {
        showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) => postBottomSheet(
                  post: post,
                ));
      },
    );
  }
}
