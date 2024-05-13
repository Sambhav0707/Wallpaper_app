//
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
//   List<String> usefavoriteImageUrls = [];
//   List<String> selectedImages = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchFavoriteImageUrls();
//   }
//
//   Future<void> _fetchFavoriteImageUrls() async {
//     usefavoriteImageUrls = await favoritesController.fetchFavoriteImageUrls();
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   void _toggleSelection(String imageUrl) {
//     setState(() {
//       if (selectedImages.contains(imageUrl)) {
//         selectedImages.remove(imageUrl);
//       } else {
//         selectedImages.add(imageUrl);
//       }
//     });
//   }
//
//   void _startSelection(String imageUrl) {
//     setState(() {
//       selectedImages.add(imageUrl);
//     });
//   }
//
//   void _cancelSelection() {
//     setState(() {
//       selectedImages.clear();
//     });
//   }
//
//   void _deleteSelected() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Delete'),
//           content: Text('Are you sure that you want to remove the selected wallpapers from favorites?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _confirmDelete();
//               },
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _confirmDelete() {
//     setState(() {
//       for (String imageUrl in selectedImages) {
//         favoritesController.removeFromFavorites(imageUrl);
//         usefavoriteImageUrls.remove(imageUrl);
//       }
//       selectedImages.clear();
//     });
//   }
//
//   void _selectAll() {
//     setState(() {
//       if (selectedImages.length < usefavoriteImageUrls.length) {
//         selectedImages.addAll(usefavoriteImageUrls);
//       }
//     });
//   }
//   @Deprecated(
//     'Use PopScope instead. '
//         'This feature was deprecated after v3.12.0-1.0.pre.',
//   )
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (selectedImages.isNotEmpty) {
//           _cancelSelection();
//           return false;
//         } else {
//           return true; // Allow normal back navigation
//         }
//       },
//       child: Scaffold(
//         appBar: selectedImages.isNotEmpty
//             ? AppBar(
//           title: Text('${selectedImages.length} selected'),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () {_deleteSelected();},
//             ),
//             IconButton(
//               icon: Icon(Icons.cancel),
//               onPressed: _cancelSelection,
//             ),
//             IconButton(
//               icon: Icon(Icons.select_all),
//               onPressed: _selectAll,
//             ),
//           ],
//         )
//             : null,
//         body: isLoading
//             ? Center(child: CircularProgressIndicator())
//             : usefavoriteImageUrls.isEmpty
//             ? Center(child: Text('There are no favorite images'))
//             : GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 5.0,
//             crossAxisSpacing: 5.0,
//             mainAxisExtent: 300,
//           ),
//           itemCount: usefavoriteImageUrls.length,
//           itemBuilder: (context, index) {
//             final imageUrl = usefavoriteImageUrls[index];
//             return GestureDetector(
//               onLongPress: () => _startSelection(imageUrl),
//               onTap: () {
//                 if (selectedImages.isNotEmpty) {
//                   _toggleSelection(imageUrl);
//                 } else {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => FavFullScreen(imgSrc: imageUrl)));
//                 }
//               },
//               child: Stack(
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10.0),
//                       child: Image.network(
//                         imageUrl,
//                         fit: BoxFit.cover, // Fixed image size
//                         errorBuilder: (context, error, stackTrace) {
//                           return Center(child: Icon(Icons.error));
//                         },
//                       ),
//                     ),
//                   ),
//                   if (selectedImages.contains(imageUrl))
//                     Positioned(
//                       top: 8,
//                       right: 8,
//                       child: Container(
//                         padding: EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.blue,
//                         ),
//                         child: Icon(
//                           Icons.check,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/CONTROLLER/favorites_controller.dart';
import 'package:wallpaper_app/VIEW/SCREENS/fav_fullscreen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final FavoritesController favoritesController = FavoritesController();
  List<String> favoriteImageUrls = [];
  List<String> selectedImages = [];
  bool isLoading = true;
  bool areAllSelected = false;

  // void _toggleSelected(){
  //   _selectAll();
  //
  //
  //   setState(() {
  //     if(areAllSelected){
  //       areAllSelected = false;
  //     }else{
  //       areAllSelected=true;
  //     }
  //   });
  // }

  void _toggleSelected() {

    setState(() {
      if (areAllSelected) {
        selectedImages.clear();
      } else {
        selectedImages.addAll(favoriteImageUrls);
      }
      areAllSelected = !areAllSelected;
    });
  }


  @override
  void initState() {
    super.initState();
    _fetchFavoriteImageUrls();
  }

  Future<void> _fetchFavoriteImageUrls() async {
    favoriteImageUrls = await favoritesController.fetchFavoriteImageUrls();
    setState(() {
      isLoading = false;
    });
  }

  void _toggleSelection(String imageUrl) {
    setState(() {
      if (selectedImages.contains(imageUrl)) {
        selectedImages.remove(imageUrl);
      } else {
        selectedImages.add(imageUrl);
      }
    });
  }

  void _startSelection(String imageUrl) {
    setState(() {
      selectedImages.add(imageUrl);
    });
  }

  void _cancelSelection() {
    setState(() {
      selectedImages.clear();
      areAllSelected = false;
    });
  }

  void _deleteSelected() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure that you want to remove the selected wallpapers from favorites?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _confirmDelete();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  // Future<void> _confirmDelete() async {
  //
  //
  //   for (String imageUrl in selectedImages) {
  //     await favoritesController.removeFromFavorites(imageUrl);
  //    setState(() {
  //      favoriteImageUrls.remove(imageUrl);
  //      favoriteImageUrls.clear();
  //      selectedImages.clear();
  //    });
  //   }
  //   setState(() {
  //     selectedImages.clear();
  //   });
  // }


  // Future<void> _confirmDelete() async {
  //   for (String imageUrl in selectedImages) {
  //     await favoritesController.removeFromFavorites(imageUrl);
  //     setState(() {
  //       favoriteImageUrls.remove(imageUrl);
  //     });
  //   }
  //   setState(() {
  //     selectedImages.clear();
  //   });
  // }

  Future<void> _confirmDelete() async {
    if (favoriteImageUrls.length == 1) {
      String imageUrlToDelete = favoriteImageUrls.first;
      await favoritesController.removeFromFavorites(imageUrlToDelete);
      setState(() {
        favoriteImageUrls.remove(imageUrlToDelete);
        selectedImages.clear();
      });
    } else {
      for (String imageUrl in selectedImages) {
        await favoritesController.removeFromFavorites(imageUrl);
      }
      setState(() {
        favoriteImageUrls.clear();
        selectedImages.clear();
      });
    }
  }


  void _selectAll() {
    setState(() {
      if (selectedImages.length < favoriteImageUrls.length) {
        selectedImages.addAll(favoriteImageUrls);
      }
    });
  }

  @Deprecated(
    'Use PopScope instead. '
        'This feature was deprecated after v3.12.0-1.0.pre.',
  )
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedImages.isNotEmpty) {
          _cancelSelection();
          return false;
        } else {
          return true; // Allow normal back navigation
        }
      },
      child: Scaffold(
        appBar: selectedImages.isNotEmpty
            ? AppBar(
          title: Text('${selectedImages.length} selected'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete,color: Colors.deepPurple,),
              onPressed: () {
                _deleteSelected();
                setState(() {

                });
              },
            ),
            IconButton(
              icon: Icon(Icons.cancel,color: Colors.deepPurple,),
              onPressed: _cancelSelection,
            ),
            IconButton(
              icon:(areAllSelected
                  ?Icon(Icons.check_box)
                  :Icon(Icons.check_box_outline_blank_outlined)
              ),
              color: Colors.deepPurple,

              onPressed: (){
               _toggleSelected();
              },
            ),
          ],
        )
            : null,
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : favoriteImageUrls.isEmpty
            ? Center(child: Text('There are no favorite images'))
            : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            mainAxisExtent: 300,
          ),
          itemCount: favoriteImageUrls.length,
          itemBuilder: (context, index) {
            final imageUrl = favoriteImageUrls[index];
            return GestureDetector(
              onLongPress: () => _startSelection(imageUrl),
              onTap: () {
                if (selectedImages.isNotEmpty) {
                  _toggleSelection(imageUrl);
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FavFullScreen(imgSrc: imageUrl)));
                }
              },
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover, // Fixed image size
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Icon(Icons.error));
                        },
                      ),
                    ),
                  ),
                  if (selectedImages.contains(imageUrl))
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


