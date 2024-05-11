import 'package:flutter/material.dart';

class CoustomAppbar extends StatelessWidget {
  const CoustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'WALLPAPERS',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple
              )
            ),
            TextSpan(
                text: '  BY SAM',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                   fontStyle: FontStyle.italic
                )
            )
          ]
        ),
      ),
    );
  }
}
