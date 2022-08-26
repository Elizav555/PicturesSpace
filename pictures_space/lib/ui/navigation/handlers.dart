import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pictures_space/ui/auth/auth_page.dart';
import 'package:pictures_space/ui/mock/mock_page.dart';

import '../../resourses/strings.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MockPage(title: 'root');
});

var authRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const AuthPage(title: Strings.login);
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
  //TODO show how to handle params
  // String? message = params["message"]?.first;
  // String? colorHex = params["color_hex"]?.first;
  // String? result = params["result"]?.first;
  // return DemoSimpleComponent(
  //     message: message ?? 'Testing', color: color, result: result);
  return const MockPage(title: Strings.profile);
});

var feedRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MockPage(title: Strings.feed);
});

var postRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MockPage(title: Strings.post);
});

var newPostRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MockPage(title: Strings.newPost);
});
