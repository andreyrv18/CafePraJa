import 'package:cafe_pra_ja/app.dart';
import 'package:cafe_pra_ja/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  usePathUrlStrategy();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseFirestore.instance.settings.persistenceEnabled;
  FirebaseFirestore.instance.settings = const Settings(
    host: 'localhost:9097', // Porta que você configurou
    sslEnabled: false,
    persistenceEnabled: true,
  );

  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(MyApp());
}
