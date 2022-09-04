import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pictures_space/domain/auth_manager.dart';
import 'package:pictures_space/ui/app/state/app_block.dart';

import '../../resourses/strings.dart';
import '../navigation/routes.dart';
import 'state/app_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appBloc}) : super(key: key);
  final AppBloc appBloc;

  @override
  Widget build(BuildContext context) {
    final router = GetIt.I.get<FluroRouter>();
    Routes.configureRoutes(router);
    return BlocProvider(
        create: (_) => appBloc,
        child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          if (state is ErrorState) {
            Future.microtask(
                () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.errorMessage),
                    )));
          }
          if (state is UnauthorizedState) {
            Future.microtask(() => state.router.navigateTo(
                  context,
                  Routes.auth,
                  clearStack: true,
                  replace: true,
                ));
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.picturesSpace,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: GetIt.I.get<AuthManager>().isLoggedIn
                ? Routes.feed
                : Routes.auth,
            onGenerateRoute: router.generator,
          );
        }));
  }
}
