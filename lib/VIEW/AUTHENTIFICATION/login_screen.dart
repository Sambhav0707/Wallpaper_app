import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/VIEW/AUTHENTIFICATION/forgot_password.dart';
import 'package:wallpaper_app/VIEW/AUTHENTIFICATION/signup_screen.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/bottomnav.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/login_page_ui_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;





  void loginUser() async {
    String emailText = _emailController.text.trim();
    String passwordText = _passwordController.text.trim();

    if (emailText.isEmpty || passwordText.isEmpty) {
      UiHelper.CoustumAlertBox(context, "Enter Required Fields");
      return; // Stop execution if fields are empty
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailText,
        password: passwordText,
      );
      _user = userCredential.user;

      if (_user != null) {
        print('User signed in: ${_user!.email}');
        // User exists, proceed with signing in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      } else {
        UiHelper.CoustumAlertBox(context, "User not found");
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Error signing in';

      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
          errorMessage = 'Invalid email or password';
          break;
        case 'user-disabled':
          errorMessage = 'User is disabled';
          break;
        default:
          errorMessage = e.message ?? 'Unknown error occurred';
          // If no specific error message is available, use a generic message
          break;
      }

      UiHelper.CoustumAlertBox(context, errorMessage);
    } catch (e) {
      UiHelper.CoustumAlertBox(context, 'An error occurred: $e');
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


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topLeft,

                              colors: [
                                Color(0xFF654ea3),
                                Color(0xFFeaafc8),


                              ]
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: TextFormField(


                          controller: _emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.black),



                              hintText: 'email',
                              suffixIcon: Icon(Icons.mail,color: Colors.black,),
                              border: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(15)
                              )
                          ),


                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topLeft,

                              colors: [
                                Color(0xFF654ea3),
                                Color(0xFFeaafc8),


                              ]
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: TextFormField(


                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.black),


                              hintText: 'password',
                              suffixIcon: Icon(Icons.password_outlined,color: Colors.black,),
                              border: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(15)
                              )
                          ),


                        ),
                      ),
                    ),
                  ),



                  SizedBox(height: 20,),
                  UiHelper.CoustomButton(() {
                   loginUser();
                  }, 'LOGIN'),
                  SizedBox(height: 15,),
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
                  ),


                  TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                      },
                      child: Text("Forgot Password",
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFFeaafc8)
                        ),


                      ))
                ],
              ),
            ),
          ),

        ],
      ) ,
    );
  }
}
