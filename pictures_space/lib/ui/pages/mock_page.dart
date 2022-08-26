import 'package:flutter/material.dart';

class MockPage extends StatelessWidget {
  const MockPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}
