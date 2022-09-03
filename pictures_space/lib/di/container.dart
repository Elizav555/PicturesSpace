import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pictures_space/data/auth_manager.dart';
import 'package:pictures_space/data/db/users_db.dart';
import 'package:pictures_space/data/pictures_space_repository.dart';
import 'package:pictures_space/data/pictures_storage.dart';
import 'package:pictures_space/domain/auth_manager.dart';
import 'package:pictures_space/domain/db/users_db.dart';
import 'package:pictures_space/domain/pictures_space_repository.dart';
import 'package:pictures_space/domain/pictures_storage.dart';
import 'package:pictures_space/resourses/strings.dart';

import '../data/db/posts_db.dart';
import '../domain/db/posts_db.dart';
import '../ui/auth/auth_bloc.dart';
import '../ui/auth/auth_page.dart';
import '../ui/feed/feed_bloc.dart';
import '../ui/feed/feed_page.dart';

Future<void> setup() async {
  final getIt = GetIt.instance;
  //Navigation
  getIt.registerSingleton<FluroRouter>(FluroRouter());

  //Google
  getIt.registerSingleton<GoogleSignIn>(GoogleSignIn());
  getIt.registerSingleton<GoogleAuthProvider>(GoogleAuthProvider());

  //Firebase
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  //Db
  getIt.registerLazySingleton<UsersDatabase>(
      () => UsersDbImpl(getIt.get<FirebaseFirestore>()));
  getIt.registerLazySingleton<PostsDatabase>(
      () => PostsDbImpl(getIt.get<FirebaseFirestore>()));

  //Storage
  getIt.registerLazySingleton<PicturesStorage>(
      () => PicturesStorageImpl(getIt.get<FirebaseStorage>()));

  //Rep
  getIt.registerLazySingleton<PicturesSpaceRep>(() => PicturesSpaceRepImpl(
      getIt.get<UsersDatabase>(),
      getIt.get<PostsDatabase>(),
      getIt.get<PicturesStorage>()));

  //Auth
  getIt.registerLazySingleton<AuthManager>(() => AuthManagerImpl(
      getIt.get<FirebaseAuth>(),
      getIt.get<GoogleSignIn>(),
      getIt.get<GoogleAuthProvider>()));

  //AuthPage
  getIt.registerFactory<AuthBloc>(() => AuthBloc(GetIt.I.get<AuthManager>()));
  getIt.registerFactory<AuthPage>(() => AuthPage(
      title: Strings.login,
      authBloc: getIt.get<AuthBloc>(),
      router: getIt.get<FluroRouter>()));

  //FeedPage
  getIt.registerFactory<FeedBloc>(
      () => FeedBloc(getIt.get<AuthManager>(), getIt.get<PicturesSpaceRep>()));
  getIt.registerFactory<FeedPage>(
      () => FeedPage(title: Strings.feed, feedBloc: getIt.get<FeedBloc>()));
}
