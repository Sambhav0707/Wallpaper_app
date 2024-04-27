import 'package:flutter/material.dart';
class FullScreen extends StatelessWidget {
  String imgSrc;
   FullScreen({super.key,required this.imgSrc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(

          image: DecorationImage(
            image: NetworkImage(imgSrc),
            fit: BoxFit.cover,
            
          ),
        ),
      ),
    );
  }
}
