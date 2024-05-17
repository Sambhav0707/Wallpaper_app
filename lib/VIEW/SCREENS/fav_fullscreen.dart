import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:wallpaper_app/CONTROLLER/favorites_controller.dart';
import 'package:wallpaper_app/VIEW/SCREENS/fullscreen.dart';

class FavFullScreen extends StatefulWidget {
  String imgSrc;
   FavFullScreen({super.key,required this.imgSrc});

  @override
  State<FavFullScreen> createState() => _FavFullScreenState();
}

class _FavFullScreenState extends State<FavFullScreen> {
  final FavoritesController favoritesController = FavoritesController();
  List<String> favoriteImageUrls = [];
  bool isLoading = true;
  final _flutterMediaDownloaderPlugin = MediaDownload();





  // Future<void> setWallpaperFromFile(
  //     String wallpaperUrl, BuildContext context) async {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text("Downloading Started...")));
  //   try {
  //     // Saved with this method.
  //     var imageId = await ImageDownloader.downloadImage(wallpaperUrl);
  //     if (imageId == null) {
  //       return;
  //     }
  //     // Below is a method of obtaining saved image information.
  //     var fileName = await ImageDownloader.findName(imageId);
  //     var path = await ImageDownloader.findPath(imageId);
  //     var size = await ImageDownloader.findByteSize(imageId);
  //     var mimeType = await ImageDownloader.findMimeType(imageId);
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Downloaded Sucessfully"),
  //
  //     ));
  //     print("IMAGE DOWNLOADED");
  //   } on PlatformException catch (error) {
  //     print(error);
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Error Occured - $error")));
  //   }
  // }

  downloadWallpaper() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: Duration(seconds: 1),content: Text("Downloading Started...")),
    );

    try {
      var imageId = await _flutterMediaDownloaderPlugin.downloadMedia(
        context,
        widget.imgSrc,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 2),content: Text("Downloaded Successfully")),
      );
    } on PlatformException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error Occurred - $error")),
      );
    }
  }






  // Future<void>setWallpaper()async{
  //   int location = WallpaperManager.HOME_SCREEN;
  //   var file = await DefaultCacheManager().getSingleFile(widget.imgSrc);
  //   final result = await WallpaperManager.setWallpaperFromFile(file.path, location);
  //
  // }

  Future<void> setWallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imgSrc);
    final result = await WallpaperManager.setWallpaperFromFile(file.path, location);

    if (result == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wallpaper set successfully!'),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to set wallpaper. Please try again.'),
          duration: Duration(seconds: 1),
        ),
      );
    }
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
                  onTap: ()async {

                    await setWallpaper();
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(imgSrc: widget.imgSrc)));


                  },
                ),
                ListTile(
                  title: Text('Lock Screen'),
                  onTap: ()async {

                  await  setWallpaperForLockScreen();
                    Navigator.pop(context);

                  },
                ),
                ListTile(
                  title: Text('Both Screens'),
                  onTap: () async{

                   await setWallpaperForBothScreen();
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

//   void showDeleteConfirmationDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Delete'),
//           content: Text('Do you really want to delete this image from favorites?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 GetRemoveFavorites();
//                 setState(() {
//
//                 });
//                 Navigator.of(context).pop();
//                 Navigator.pop(context);
//               },
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   GetRemoveFavorites()async{
//   await  favoritesController.removeFromFavorites(widget.imgSrc);
//
// setState(() {
//
// });
//
//   }

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
                    margin: EdgeInsets.only(bottom: 15,left: 25),
                    height: 50,
                    child: InkWell(onTap:(){
                      Navigator.pop(context);
                    },
                        child: Icon(Icons.cancel_outlined,size: 50,color: Colors.purpleAccent.shade100,)),
                  ),
                  // SizedBox(
                  //   width: 40,
                  // ),
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
                            color: Colors.black


                          ),
                        )
                        ),

                      ),
                    ),

                  ),
                  SizedBox(
                    width: 40,

                  ),

                  InkWell(
                    onTap: (){


downloadWallpaper();


                    },
                    child: Container(

                      margin: EdgeInsets.only(bottom: 40),
                      height: 20,
                      child: Icon(Icons.download,
                          color: Colors.deepPurple,
                          size: 50,

                        ),
                      ),
                  ),


                ],
              ),

            )
          ]
      ),
    );
  }
}
