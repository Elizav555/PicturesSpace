import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Image.network(
            'https://i.pinimg.com/originals/01/e5/a0/01e5a0b5b159f229fa975b6b704569b1.jpg'),
      ),
    );
  }
}
