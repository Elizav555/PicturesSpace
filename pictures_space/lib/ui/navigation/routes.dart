import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../resourses/strings.dart';
import 'handlers.dart';

class Routes {
  static String auth = "auth";
  static String registration = "auth/registration";
  static String profile = "/profile";
  static String feed = "feed";
  static String post = "/feed/post";
  static String newPost = "/newpost";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      if (kDebugMode) {
        print(Strings.error);
      }
      return;
    });
    router.define(auth, handler: authRouteHandler);
    router.define(registration,
        handler: authRegistrationHandler,
        transitionType: TransitionType.inFromLeft);
    router.define(profile, handler: profileRouteHandler);
    router.define(feed, handler: feedRouteHandler);
    router.define(post, handler: postRouteHandler);
    router.define(newPost, handler: newPostRouteHandler);
  }
}
