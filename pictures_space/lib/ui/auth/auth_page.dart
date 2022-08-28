import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pictures_space/resourses/strings.dart';
import 'package:pictures_space/ui/widgets/edit_text.dart';

import '../navigation/routes.dart';
import 'auth_bloc.dart';
import 'auth_events.dart';
import 'auth_state.dart';

class AuthPage extends StatefulWidget {
  const AuthPage(
      {Key? key,
      required this.title,
      required this.authBloc,
      required this.router})
      : super(key: key);
  final String title;
  final AuthBloc authBloc;
  final FluroRouter router;

  @override
  State<StatefulWidget> createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return Strings.emailError;
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 10 ||
        !value.contains(RegExp(r'[A-Z]'), 0) ||
        !value.contains(RegExp(r'[0-9]'), 0)) {
      return Strings.passwordError;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocProvider(
          create: (_) => widget.authBloc,
          child: BlocBuilder<AuthBloc, AuthState>(
              bloc: widget.authBloc,
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SuccessState) {
                  return Center(
                      child: ElevatedButton(
                          onPressed: () => widget.router.navigateTo(
                                context,
                                Routes.feed,
                                clearStack: true,
                                /*TODO pass userId
                                var usersHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
                                  return UsersScreen(params["id"][0]);
                                    });
                                  void defineRoutes(FluroRouter router) {
                                    router.define("/users/:id", handler: usersHandler);
                                   */
                              ),
                          child: const Text(Strings.authSuccessBtn)));
                } else if (state is LoadedState) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/login_image.png'),
                        const Text(Strings.picturesSpace),
                        EditText(
                          controller: _emailController,
                          label: Strings.email,
                          maxLength: 50,
                          validateInput: validateEmail,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        EditText(
                          controller: _passwordController,
                          label: Strings.password,
                          validateInput: validatePassword,
                          obscureText: true,
                        ),
                        ElevatedButton(
                            onPressed: () => context.read<AuthBloc>().add(
                                SignInEvent(_emailController.text,
                                    _passwordController.text)),
                            child: const Text(Strings.login)),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                              onPressed: () => context
                                  .read<AuthBloc>()
                                  .add(GoogleSignInEvent()),
                              child: const Text(Strings.signInGoogle)),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                              onPressed: () =>
                                  context.read<AuthBloc>().add(RegisterEvent()),
                              child: const Text(Strings.registration)),
                        )
                      ]);
                } else {
                  return const Center(child: Text(Strings.error));
                }
              }),
        ));
  }
}
