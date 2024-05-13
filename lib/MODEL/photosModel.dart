

class PhotosModel{
  String imgSrc;


  PhotosModel({
    required this.imgSrc,

  });


  static fromAPI2App(Map<String , dynamic> photoMap){
    // return PhotosModel(imgSrc: (photoMap["src"])["portrait"],
    //   photographer: photoMap['photographer'],
    //   photographerUrl: photoMap['photographer_url'],
    //   id: photoMap['id'],
    //   width: photoMap['width'],
    //   height: photoMap['height'],
    // );

    return PhotosModel(
        imgSrc: (photoMap["src"])["portrait"]);
  }



  }
