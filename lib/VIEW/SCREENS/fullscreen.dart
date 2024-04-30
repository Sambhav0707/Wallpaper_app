import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
class FullScreen extends StatefulWidget {
  String imgSrc;
   FullScreen({super.key,required this.imgSrc});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {



  addToFav(String imgSrc){
    if(imgSrc.isEmpty){
      log("error occured");
    }
    else{
      FirebaseFirestore.instance.collection("FavWallpaper").doc(imgSrc).set({
        "imgSource":imgSrc,
      }).then((value){
        log("data inserted");
      });
    }
  }



   Future<void>setWallpaper()async{
     int location = WallpaperManager.HOME_SCREEN;
     var file = await DefaultCacheManager().getSingleFile(widget.imgSrc);
     final result = await WallpaperManager.setWallpaperFromFile(file.path, location);

   }

   Future<void>setWallpaperForLockScreen()async{
     int location = WallpaperManager.LOCK_SCREEN;
     var file = await DefaultCacheManager().getSingleFile(widget.imgSrc);
     final result = await WallpaperManager.setWallpaperFromFile(file.path, location);

   }
   Future<void>setWallpaperForBothScreen()async{
     int location = WallpaperManager.BOTH_SCREEN;
     var file = await DefaultCacheManager().getSingleFile(widget.imgSrc);
     final result = await WallpaperManager.setWallpaperFromFile(file.path, location);

   }

   showWallpaperOptions() {
     showModalBottomSheet<void>(
       context: context,
       builder: (BuildContext context) {
         return Container(

           child: Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 ListTile(
                   title: Text('Home Screen'),
                   onTap: () {

                     setWallpaper();
                     Navigator.pop(context);

                   },
                 ),
                 ListTile(
                   title: Text('Lock Screen'),
                   onTap: () {

                     setWallpaperForLockScreen();
                     Navigator.pop(context);

                   },
                 ),
                 ListTile(
                   title: Text('Both Screens'),
                   onTap: () {

                     setWallpaperForBothScreen();
                     Navigator.pop(context);

                   },
                 ),
                 ListTile(
                   title: Text('CANCEL'),
                   onTap: () {
                     Navigator.pop(context);


                   },
                 ),
               ],
             ),
           ),
         );
       },
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(

            image: DecorationImage(
              image: NetworkImage(widget.imgSrc),
              fit: BoxFit.cover,

            ),
          ),

        ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [

                Container(
                  margin: EdgeInsets.only(bottom: 15,left: 35),
                  height: 50,
                  child: InkWell(onTap:(){
                    Navigator.pop(context);
                  },
                      child: Icon(Icons.cancel_outlined,size: 50,color: Colors.purpleAccent.shade100,)),
                ),
                SizedBox(
                  width: 20,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      showWallpaperOptions();
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15,left: 35),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30,width: 1),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFc79aae),
                            Colors.white54,
                          ]
                        )
                      ),
                      child: Center(child: Text('SET WALLPAPER',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,


                      ),
                      )
                      ),

                    ),
                  ),

                ),
                SizedBox(
                  width: 100,
                ),
                InkWell(
                  onTap: (){
                    addToFav(widget.imgSrc.toString());


                  },
                  child: Icon(Icons.favorite_border_outlined,

                  ),
                )

              ],
            ),

          )
    ]
      ),
    );
  }
}
