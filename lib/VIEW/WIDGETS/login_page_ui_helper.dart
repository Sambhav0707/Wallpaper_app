import 'package:flutter/material.dart';


class UiHelper {
  static CoustomTextField(TextEditingController controller,String text,IconData iconData,bool tohide){


    return Padding(
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
        child: TextFormField(


          controller: controller,
          obscureText: tohide ,
          decoration: InputDecoration(
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,


            hintText: text,
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(15)
            )
          ),


        ),
      ),
    );
  }

  static CoustomButton(VoidCallback voidCallback,String text){
    return SizedBox(

      height: 50,
      width: 150,
      child: GestureDetector(
        onTap: (){
          voidCallback();
        },
        child: Container(


          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topLeft,

                  colors: [
                    Color(0xFF654ea3),
                    Color(0xFFeaafc8),


                  ]
              )

          ),
          child: Center(
            child: Text(text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              color: Colors.black87,

            ),),
          ),
        ),
      ),
    );



  }


  static CoustomTextFieldForSignUP(TextEditingController controller,String text,IconData iconData,bool tohide){

    return Padding(
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
        child: TextFormField(


          controller: controller,
          obscureText: tohide ,
          decoration: InputDecoration(

              hintText: text,
              suffixIcon: Icon(iconData),
              border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(15)
              )
          ),


        ),
      ),
    );
  }
  static CoustumAlertBox(BuildContext context ,String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("OK"))
        ],

      );
    });
  }

}