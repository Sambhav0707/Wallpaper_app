import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/CONTROLLER/favorites_controller.dart';
import 'package:wallpaper_app/VIEW/SCREENS/fav_fullscreen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
 //  final FirebaseAuth auth = FirebaseAuth.instance;
 // late final currentUser = auth.currentUser;
 //  late final userEmail = currentUser!.email;
 //  List<String> usefavoriteImageUrls = [];
  final FavoritesController favoritesController = FavoritesController();
  List<String> usefavoriteImageUrls = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    GetFetchFavoriteImageUrls();
  }



 GetFetchFavoriteImageUrls()async{
   usefavoriteImageUrls = await favoritesController.fetchFavoriteImageUrls();
    setState(() {

      isLoading = false;

    });


  }




  // Future<void> _fetchFavoriteImageUrls() async {
  //   if (userEmail != null) {
  //     final favoritesCollection = FirebaseFirestore.instance.collection(userEmail!);
  //     final document = await favoritesCollection.doc('favorites').get();
  //
  //     if (document.exists) {
  //       final imageUrls = document.data()?['image source'] as List<dynamic>?;
  //       if (imageUrls != null) {
  //         setState(() {
  //           favoriteImageUrls = imageUrls.map((url) => url as String).toList();
  //         });
  //       }
  //     }
  //   }
  // }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: FutureBuilder(
        future: GetFetchFavoriteImageUrls(),
        builder: (context, snapshot) {
            if (snapshot.hasError) {
            // If there's an error, display an error message
            return Center(child: Text('Error fetching data'));
          } else {
            // Once data is fetched, show the images
            return  isLoading ? Center(child: CircularProgressIndicator()) : usefavoriteImageUrls.isNotEmpty
                ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                mainAxisExtent: 300,
              ),
              itemCount: usefavoriteImageUrls.length,
              itemBuilder: (context, index) {
                final imageUrl = usefavoriteImageUrls[index];
                return Container(
                  child: InkWell(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>FavFullScreen(imgSrc: imageUrl)));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Icon(Icons.error));
                        },
                      ),
                    ),
                  ),
                );
              },
            )
                : Center(child: Text('there are no favorite images')) ;
          }
        },
      ),
    );
    // return Scaffold(
    //
    //   body: usefavoriteImageUrls.isNotEmpty
    //       ? GridView.builder(
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2, // Adjust as needed for desired columns
    //       mainAxisSpacing: 10.0,
    //       crossAxisSpacing: 10.0,
    //       mainAxisExtent: 300,
    //     ),
    //     itemCount: favoritesController.favoriteImageUrls.length,
    //     itemBuilder: (context, index) {
    //       final imageUrl = favoritesController.favoriteImageUrls[index];
    //       return Container(
    //         child: InkWell(
    //           onTap: (){
    //
    //           },
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(10.0),
    //             child: Image.network(
    //               imageUrl,
    //               fit: BoxFit.cover,
    //               errorBuilder: (context, error, stackTrace) {
    //                 return Center(child: Icon(Icons.error));
    //               },
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ): const Center(child: Text('No favorite images found')),
    // );
  }
}

//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:wallpaper_app/CONTROLLER/favorites_controller.dart';
// import 'package:wallpaper_app/VIEW/SCREENS/fav_fullscreen.dart';
//
// class FavoriteScreen extends StatefulWidget {
//   const FavoriteScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }
//
// class _FavoriteScreenState extends State<FavoriteScreen> {
//   final FavoritesController favoritesController = FavoritesController();
//   List<String> favoriteImageUrls = [];
//   bool isLoading = true; // Flag to control loading state
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   Future<void> fetchData() async {
//     // Fetch favorite image URLs asynchronously
//     favoriteImageUrls = await favoritesController.fetchFavoriteImageUrls();
//
//     // Update loading state and UI after data is fetched
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: isLoading
//             ? CircularProgressIndicator() // Display loading indicator
//             : favoriteImageUrls.isNotEmpty
//             ? GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 10.0,
//             crossAxisSpacing: 10.0,
//             mainAxisExtent: 300,
//           ),
//           itemCount: favoriteImageUrls.length,
//           itemBuilder: (context, index) {
//             final imageUrl = favoriteImageUrls[index];
//             return Container(
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => FavFullScreen(imgSrc: imageUrl),
//                     ),
//                   );
//                 },
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: Image.network(
//                     imageUrl,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Center(child: Icon(Icons.error));
//                     },
//                   ),
//                 ),
//               ),
//             );
//           },
//         )
//             : Text('There are no favorite images'), // Display "no favorites" message
//       ),
//     );
//   }
// }
