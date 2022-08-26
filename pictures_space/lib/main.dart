import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pictures_space/ui/app.dart';

import 'di/container.dart' as di;
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.setup();
  runApp(const MyApp());
}
