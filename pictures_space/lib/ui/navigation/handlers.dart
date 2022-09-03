import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pictures_space/ui/auth/auth_page.dart';
import 'package:pictures_space/ui/mock/mock_page.dart';

import '../../resourses/strings.dart';
import '../feed/feed_page.dart';

var authRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return GetIt.I.get<AuthPage>();
});

var authRegistrationHandler = Handler(
    type: HandlerType.function,
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      showDialog(
        context: context!,
        builder: (context) {
          return AlertDialog(
            title: const Text(Strings.registration),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [Text('Modal with registration')],
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("OK"),
                ),
              ),
            ],
          );
        },
      );
      return;
    });

var profileRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MockPage(title: Strings.profile);
});

var feedRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return GetIt.I.get<FeedPage>();
});

var postRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MockPage(title: Strings.post);
});

var newPostRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MockPage(title: Strings.newPost);
});
