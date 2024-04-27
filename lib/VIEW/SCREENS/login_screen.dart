import 'package:flutter/material.dart';
import 'package:wallpaper_app/VIEW/SCREENS/signup_screen.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/bottomnav.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/login_page_ui_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                  UiHelper.CoustomTextField(emailController, 'email', Icons.mail, false),
                  UiHelper.CoustomTextField(passwordController, 'password', Icons.password, true),
                  SizedBox(height: 30,),
                  UiHelper.CoustomButton(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));
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