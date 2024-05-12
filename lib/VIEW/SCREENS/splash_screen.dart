
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //   const Duration(seconds: 3),
    //       () {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => BottomNav()),
    //     );
    //   },
    // );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF41295a),
            Color(0xFF2F0743)
            // Colors.white54,

          ]
        )
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 400,


                child: Lottie.asset("images/spl6.json",height: 400)),
          ),
          SizedBox(height: 20), // Adding some space below the animation
          Text(
            "Discover-Set-Enjoy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              color: Colors.amber.shade800,
              decoration: TextDecoration.none
            ),
          ),


        ],
      ),
    );
  }
}
