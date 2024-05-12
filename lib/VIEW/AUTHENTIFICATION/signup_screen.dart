import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/VIEW/AUTHENTIFICATION/login_screen.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/bottomnav.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/login_page_ui_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();





  Future<void> signUp(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UiHelper.CoustumAlertBox(context, "Enter Required Fields");
      return; // Exit the function if fields are empty
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        print('user created');
        final userEmail = userCredential.user!.email; // Get user email

        // Create a collection named after the user's email
        await FirebaseFirestore.instance.collection(userEmail!).doc('favorites').set({
          'image source':[''], // Set an empty string for "image source" field
        });

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNav()));
      } else {
        UiHelper.CoustumAlertBox(context, "User creation failed");
      }
    } on FirebaseAuthException catch (ex) {
      UiHelper.CoustumAlertBox(context, ex.code.toString());
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,


      body:Stack(
        children: [

          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text('SIGNING YOU IN...',
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
            padding: const EdgeInsets.only(top: 45,left: 20,right: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(MediaQuery.of(context).size.width, 110)
              ),
              color: Colors.black87,


            ),
          ),
          Container(
            height: 400,
            margin: const EdgeInsets.only(top: 148,left: 40,right: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
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
                  // UiHelper.CoustomTextFieldForSignUP(usernameController, 'username', Icons.person, false),
                  UiHelper.CoustomTextField(controller, 'email', Icons.mail, false),
                  UiHelper.CoustomTextField(controller2, 'password', Icons.password, true),
                  const SizedBox(height: 30,),
                  UiHelper.CoustomButton(() {
                    signUp(controller.text, controller.text);
                  }, 'SIGN UP'),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Have An Account",
                        style: TextStyle(
                            fontSize: 15
                        ),

                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));

                      },
                          child: const Text("LOGIN",
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
