import 'package:flutter/material.dart';

import '../../domain/model/post.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Image.network(post.imageUrl),
      ),
    );
  }
}
