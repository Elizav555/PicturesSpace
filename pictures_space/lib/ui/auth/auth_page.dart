import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pictures_space/domain/auth_manager.dart';

class AuthPage extends StatefulWidget {
  const AuthPage(
      {Key? key,
      required this.title,
      required this.authManager,
      required this.router})
      : super(key: key);

  final String title;
  final AuthManager authManager;
  final FluroRouter router;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(),
    );
  }
}
