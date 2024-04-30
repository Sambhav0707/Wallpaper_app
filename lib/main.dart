import 'package:flutter/material.dart';
import 'package:wallpaper_app/VIEW/SCREENS/login_screen.dart';
import 'package:wallpaper_app/VIEW/SCREENS/search.dart';
import 'package:wallpaper_app/VIEW/SCREENS/signup_screen.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/bottomnav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(brightness: Brightness.dark),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
