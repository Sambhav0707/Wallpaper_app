


import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:wallpaper_app/CONTROLLER/favorites_controller.dart';

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

  void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Do you really want to delete this image from favorites?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                GetRemoveFavorites(); // Call the method to remove from favorites
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pop(context); // Navigate back to favorite screen
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
  Future<void> refreshData() async {
    // Fetch updated favorite image URLs asynchronously after removal
    favoriteImageUrls = await favoritesController.fetchFavoriteImageUrls();

    // Update the UI after data is fetched
    setState(() {});
  }

  GetRemoveFavorites()async{
  await  favoritesController.removeFromFavorites(widget.imgSrc);

refreshData();

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

                        showDeleteConfirmationDialog();




                    },
                    child: Container(

                      margin: EdgeInsets.only(bottom: 40),
                      height: 20,
                      child: Icon(Icons.delete,
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
