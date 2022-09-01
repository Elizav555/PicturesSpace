import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key, required this.title, required this.credential})
      : super(key: key);
  final String title;
  final UserCredential credential;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}
