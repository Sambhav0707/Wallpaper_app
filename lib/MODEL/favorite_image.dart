import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteImage {
  final String imgSrc;

  FavoriteImage({required this.imgSrc});

  factory FavoriteImage.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return FavoriteImage(imgSrc: data['imgSrc']);
  }
}
