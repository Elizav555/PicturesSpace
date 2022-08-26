import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pictures_space/data/auth_manager.dart';
import 'package:pictures_space/domain/auth_manager.dart';

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

  //Auth
  getIt.registerLazySingleton<AuthManager>(() => AuthManagerImpl(
      getIt.get<FirebaseAuth>(),
      getIt.get<GoogleSignIn>(),
      getIt.get<GoogleAuthProvider>()));
}
