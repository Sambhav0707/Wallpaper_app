import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesController{
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final currentUser = auth.currentUser;
  late final userEmail = currentUser!.email;
  List<String> favoriteImageUrls = [];


   Future fetchFavoriteImageUrls() async {
    if (userEmail != null) {
      final favoritesCollection = FirebaseFirestore.instance.collection(userEmail!);
      final document = await favoritesCollection.doc('favorites').get();

      if (document.exists) {
        final imageUrls = document.data()?['image source'] as List<dynamic>?;
        if (imageUrls != null) {

            favoriteImageUrls = imageUrls.map((url) => url as String).toList();

        }
      }
    }
    return favoriteImageUrls;
  }

  addToFavorites(String imgSrc) {

    CollectionReference favoritesCollection = FirebaseFirestore.instance.collection(userEmail!);


    DocumentReference documentReference = favoritesCollection.doc('favorites');


    documentReference.update({

      'image source': FieldValue.arrayUnion([imgSrc]),
    }).then((_) {
      print('URL added to favorites successfully: $imgSrc');
    }).catchError((error) {
      print('Failed to add URL to favorites: $error');
    });
  }
   removeFromFavorites(String imgSrc) async {
    CollectionReference favoritesCollection = FirebaseFirestore.instance.collection(userEmail!);
    DocumentReference documentReference = favoritesCollection.doc('favorites');

    // Update the document
    await documentReference.update({
      'image source': FieldValue.arrayRemove([imgSrc]),
    }).then((_) {
      print('URL removed from favorites successfully: $imgSrc');
    }).catchError((error) {
      print('Failed to remove URL from favorites: $error');
    });


  }












}