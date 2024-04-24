class PhotosModel{
  String imgSrc;
  PhotosModel({required this.imgSrc});


  static fromAPI2App(Map photoMap){
    return PhotosModel(imgSrc: (photoMap["src"])["portrait"]);
  }
}