import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/post_widget.dart';
import 'feed_bloc.dart';
import 'feed_state.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key, required this.title}) : super(key: key);
  final String title;
  final FeedBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<FeedBloc, FeedState>(builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: state is LoadedState
                ? Expanded(
                    child: ListView(
                        children: state.data.map((item) => const PostWidget())))
                : const Center(child: CircularProgressIndicator()));
      }),
    );
  }
}
