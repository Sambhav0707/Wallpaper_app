import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:wallpaper_app/CONTROLLER/favorites_controller.dart';
class FullScreen extends StatefulWidget {
  String imgSrc;

  FullScreen({super.key,required this.imgSrc});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {


  final FavoritesController favoritesController = FavoritesController();
  // final FirebaseAuth auth = FirebaseAuth.instance;
  //  late final currentUser = auth.currentUser;
  // late final userEmail = currentUser!.email;
  // void addToFavorites() {
  //   // Get the reference to the Firestore collection
  //   CollectionReference favoritesCollection = FirebaseFirestore.instance.collection(userEmail!);
  //
  //   // Assuming you have a specific document containing the list of favorites
  //   // Replace 'your_document_id' with the actual ID of the document
  //   DocumentReference documentReference = favoritesCollection.doc('favorites');
  //
  //   // Update the document
  //   documentReference.update({
  //     // Assuming 'imageSource' is the name of the field storing the list of URLs
  //     'image source': FieldValue.arrayUnion([widget.imgSrc]),
  //   }).then((_) {
  //     print('URL added to favorites successfully: $widget.imgSrc');
  //   }).catchError((error) {
  //     print('Failed to add URL to favorites: $error');
  //     });
  // }

  // GetAddtoFav()async{
  //   favoritesController.addToFavorites(widget.imgSrc);
  //
  //
  //
  // }

  GetAddtoFav() async {
    await favoritesController.fetchFavoriteImageUrls(); // Fetch favorite image URLs

    // Check if the current image is already in favorites
    if (favoritesController.favoriteImageUrls.contains(widget.imgSrc)) {
      // If already in favorites, show a message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('The image is already in favorites.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // If not in favorites, add it and show a message
      favoritesController.addToFavorites(widget.imgSrc);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('The image has been added to favorites.'),
          duration: Duration(seconds: 2),
        ),
      );
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

                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: InkWell(
                    onTap: (){
                      GetAddtoFav();


                    },
                    child: Icon(Icons.favorite_border_outlined,

                    ),
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
