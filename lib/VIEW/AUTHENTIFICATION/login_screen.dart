import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/VIEW/AUTHENTIFICATION/signup_screen.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/bottomnav.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/login_page_ui_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // TextEditingController controller = TextEditingController();

  TextEditingController Controller = TextEditingController();
  TextEditingController Controller2 = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;


  // void loginUser() async {
  //   String email = Controller.text.trim();
  //   String password = Controller2.text.trim();
  //
  //   if (email.isEmpty || password.isEmpty) {
  //     UiHelper.CoustumAlertBox(context, "Enter Required Fields");
  //     return; // Stop execution if fields are empty
  //   }
  //
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     user = userCredential.user;
  //
  //     if (user != null) {
  //       print('User signed in: ${user!.email}');
  //       // User exists, proceed with signing in
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => BottomNav()),
  //       );
  //     } else {
  //       // This block shouldn't execute because user will not be null if signInWithEmailAndPassword is successful
  //       UiHelper.CoustumAlertBox(context, "User not found");
  //     }
  //   } catch (e) {
  //     String errorMessage = 'Error signing in';
  //
  //     if (e is FirebaseAuthException) {
  //       switch (e.code) {
  //         case 'user-not-found':
  //         case 'wrong-password':
  //           errorMessage = 'Wrong email or password';
  //           break;
  //         case 'user-disabled':
  //           errorMessage = 'User is disabled';
  //           break;
  //         default:
  //           errorMessage = e.message ?? 'Unknown error occurred';
  //           // If no specific error message is available, use a generic message
  //           break;
  //       }
  //     }
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Login Error'),
  //           content: Text(errorMessage),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(); // Close the dialog
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  void loginUser() async {
    String email = Controller.text.trim();
    String password = Controller2.text.trim();

    if (email.isEmpty || password.isEmpty) {
      UiHelper.CoustumAlertBox(context, "Enter Required Fields");
      return; // Stop execution if fields are empty
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      if (user != null) {
        print('User signed in: ${user!.email}');
        // User exists, proceed with signing in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      } else {
        UiHelper.CoustumAlertBox(context, "User not found");
      }
    } catch (e) {
      String errorMessage = 'Error signing in';

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
          case 'wrong-password':
            errorMessage = 'Wrong email or password';
            break;
          case 'user-disabled':
            errorMessage = 'User is disabled';
            break;
          default:
            errorMessage = e.message ?? 'Unknown error occurred';
            // If no specific error message is available, use a generic message
            break;
        }
      } else {
        errorMessage = e.toString();
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,

      // appBar: AppBar(
      //
      //   title: Text('LETs GET YOU LOGGED IN',style: TextStyle(
      //     fontSize: 30,
      //     fontStyle: FontStyle.italic,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.purple.shade800
      //   ),),
      //   centerTitle: true,
      //
      // ),
      body:Stack(
        children: [
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 50,
          //   color: Colors.white30,
          // ),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text('LETs GET YOU LOGGED IN...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 25
                ),

              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
            padding: EdgeInsets.only(top: 45,left: 20,right: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(MediaQuery.of(context).size.width, 110)
              ),
              color: Colors.black87,
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomLeft,
              //   colors: [
              //
              //     Colors.purpleAccent,
              //     Colors.white54,
              //   ]
              // )

            ),
          ),
          Container(
            height: 400,
            margin: EdgeInsets.only(top: 200,left: 40,right: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.purpleAccent,
                    ]
                )

            ),
            child: Material(
              elevation: 9,
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueGrey,

              child: Column(
                children: [
                  UiHelper.CoustomTextField(Controller, 'email', Icons.mail, false),
                  UiHelper.CoustomTextField(Controller2, 'password', Icons.password, true),
                  SizedBox(height: 30,),
                  UiHelper.CoustomButton(() {
                   loginUser();
                  }, 'LOGIN'),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have An Account",
                        style: TextStyle(
                          fontSize: 15
                        ),

                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));

                      },
                          child: Text("SIGN UP",
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: Color(0xFFeaafc8)
                            ),

                          )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

        ],
      ) ,
    );
  }
}
