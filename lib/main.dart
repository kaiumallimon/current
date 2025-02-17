import 'package:current/app/data/repositories/hive/_auth_opt.dart';
import 'package:current/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // initialize hive
  await Hive.initFlutter();
  await Hive.openBox('authBox');

  // logout user if user did not remember
  if (!await AuthOptions().isRemembered()) {
    await FirebaseAuth.instance.signOut();
  }

  runApp(CurrentApp());
}
