import 'package:chat_app_final/firebase_options.dart';
import 'package:chat_app_final/pages/login_page.dart';
import 'package:chat_app_final/pages/register_page.dart';
import 'package:chat_app_final/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth/auth_gate.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // home:  RegisterPage(),
    // initialRoute: '/',
    // routes: {
    //   '/': (context) => const AuthGate(),
    //   '/registerPage': (context) => RegisterPage(),
        home: AuthGate(),

      theme: lightMode,
    );
  }
}

