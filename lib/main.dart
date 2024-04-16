import 'package:chat_app_final/firebase_options.dart';
import 'package:chat_app_final/pages/home_page.dart';
import 'package:chat_app_final/pages/login_page.dart';
import 'package:chat_app_final/pages/register_page.dart';
import 'package:chat_app_final/themes/light_mode.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    listenToAuthChanges();
    super.initState();
  }
  void listenToAuthChanges() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if(_navigatorKey.currentState?.context!=null){
          if (user == null) {
            Navigator.pushNamedAndRemoveUntil(_navigatorKey.currentState!.context, '/loginPage', (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(_navigatorKey.currentState!.context, '/homePage', (route) => false);
          }
        }else{
          print('context not found!');
        }

      });

    });
  }
  @override

  Widget build(BuildContext context) {
    final bool isLoggedIn = FirebaseAuth.instance.currentUser!=null;
    return MaterialApp(
      key: _navigatorKey,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),

    initialRoute: isLoggedIn ? '/homePage':'/loginPage',
    routes: {
      '/loginPage': (context) =>LoginPage(),
      '/registerPage': (context) => RegisterPage(),
      '/homePage': (context) => const HomePage(),
    },
    //     home: AuthGate(),

      theme: lightMode,
    );
  }
}

