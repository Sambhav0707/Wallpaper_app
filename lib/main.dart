// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:wallpaper_app/VIEW/AUTHENTIFICATION/login_screen.dart';
// import 'package:wallpaper_app/VIEW/SCREENS/search.dart';
// import 'package:wallpaper_app/VIEW/AUTHENTIFICATION/signup_screen.dart';
// import 'package:wallpaper_app/VIEW/SCREENS/splash_screen.dart';
// import 'package:wallpaper_app/VIEW/WIDGETS/bottomnav.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       themeMode: ThemeMode.dark,
//       theme: ThemeData(brightness: Brightness.dark),
//       home:StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return const SplashScreen();
//           }
//           if (snapshot.hasError) {
//             return Scaffold(body: Text(snapshot.error.toString()));
//           }
//           return const LoginPage();
//         },
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/VIEW/AUTHENTIFICATION/login_screen.dart';
import 'package:wallpaper_app/VIEW/SCREENS/search.dart';
import 'package:wallpaper_app/VIEW/AUTHENTIFICATION/signup_screen.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/bottomnav.dart';
import 'package:wallpaper_app/VIEW/SCREENS/splash_screen.dart';
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
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while checking authentication state
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasData) {
            // User is logged in, show SplashScreen and then BottomNav
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BottomNav()),
              );
            });
            return const SplashScreen();
          } else {
            // User is not logged in, show SplashScreen and then LoginPage
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            });
            return const SplashScreen();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
