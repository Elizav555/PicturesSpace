import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pictures_space/domain/auth_manager.dart';

import '../resourses/strings.dart';
import 'navigation/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = GetIt.I.get<FluroRouter>();
    Routes.configureRoutes(router);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.picturesSpace,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:
          GetIt.I.get<AuthManager>().isLoggedIn ? Routes.feed : Routes.auth,
      onGenerateRoute: router.generator,
    );
  }
}
