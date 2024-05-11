


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/login_page_ui_helper.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}
TextEditingController _emailController = TextEditingController();


Future passwordReset(BuildContext context)async{
  if(_emailController.text.isEmpty){

    UiHelper.CoustumAlertBox(context as BuildContext, "Enter the required fields!!!");
  }
  else{
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
    Fluttertoast.showToast(
        msg: "Email sent successfully! Check your inbox to reset your password.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.purple,
        textColor: Colors.white,
        fontSize: 16.0);
  } on FirebaseAuthException catch(e){
    print(e);

    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        content: Text(e.message.toString()),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("OKAY"))
        ],
      );
    });
  }}

}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 200),
        height: MediaQuery.of(context).size.height,

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              child: Container(
                child: Text("Enter your email and we will send you a reset password link",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
            SizedBox(
              height: 30,
            ),
            TextButton(onPressed: (){ passwordReset(context);}, child:Text("SEND EMAIL"))
          ],
        ),
      )
    );
  }
}
