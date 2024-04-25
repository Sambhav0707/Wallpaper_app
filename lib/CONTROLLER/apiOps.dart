import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:wallpaper_app/MODEL/photosModel.dart';


class ApiOperations{
  static List<PhotosModel> trendingWallpapers=[];
  static int page = 1;
  static List<PhotosModel> searchWallpapersList=[];
  static List<PhotosModel> categoryWallpapersList=[];
  static List<PhotosModel> categoryWallpapersListCars=[];
  static List<PhotosModel> categoryWallpapersListMountains=[];
  static List<PhotosModel> categoryWallpapersListSunsets=[];
  static List<PhotosModel> categoryWallpapersListSports=[];






  static Future<List<PhotosModel>>


  getTrendingWallpapers()async{


   await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=30'),

     headers: {'Authorization':'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}

   ).then((value){
     Map result = jsonDecode(value.body);

     List images = result['photos'];
     images.forEach((element) {
       trendingWallpapers.add(PhotosModel.fromAPI2App(element));

     });

   });
   return trendingWallpapers;
  }

  loadMore() async {
    page = page + 1;
    String url = "https://api.pexels.com/v1/curated?per_page=30&page=" + page.toString();
    await http.get(Uri.parse(url), headers: {'Authorization': 'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}).then((value) {
      Map result = jsonDecode(value.body);
      List images = result['photos'];
      images.forEach((element) {
        trendingWallpapers.add(PhotosModel.fromAPI2App(element));
      });
    });
  }


  static searchWallpapers(String query)async{
    await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$query=&per_page=30'),

        headers: {'Authorization':'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}

    ).then((value){
      Map result = jsonDecode(value.body);

      List images = result['photos'];
      searchWallpapersList.clear();
      images.forEach((element) {
        searchWallpapersList.add(PhotosModel.fromAPI2App(element));

      });

    });
    return searchWallpapersList;


  }
  loadSearchResultsMore(String query) async {
    page = page + 1;
    String url = "https://api.pexels.com/v1/search?query=$query&per_page=30&page=" + page.toString();
    await http.get(Uri.parse(url), headers: {'Authorization': 'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}).then((value) {
      Map result = jsonDecode(value.body);
      List images = result['photos'];
      images.forEach((element) {
        searchWallpapersList.add(PhotosModel.fromAPI2App(element));
      });
    });
  }


  static selectedCategory(String wildlife)async{
    await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$wildlife=&per_page=30'),

        headers: {'Authorization':'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}

    ).then((value){
      Map result = jsonDecode(value.body);

      List images = result['photos'];
      categoryWallpapersList.clear();
      images.forEach((element) {
        categoryWallpapersList.add(PhotosModel.fromAPI2App(element));

      });

    });
    return categoryWallpapersList;


  }
  loadCategoryResultsMore(String wildlife) async {
    page = page + 1;
    String url = "https://api.pexels.com/v1/search?query=$wildlife&per_page=30&page=" + page.toString();
    await http.get(Uri.parse(url), headers: {'Authorization': 'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}).then((value) {
      Map result = jsonDecode(value.body);
      List images = result['photos'];
      images.forEach((element) {
        categoryWallpapersList.add(PhotosModel.fromAPI2App(element));
      });
    });
  }

  static selectedCategoryCars(String cars)async{
    await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$cars=&per_page=30'),

        headers: {'Authorization':'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}

    ).then((value){
      Map result = jsonDecode(value.body);

      List images = result['photos'];
      categoryWallpapersListCars.clear();
      images.forEach((element) {
        categoryWallpapersListCars.add(PhotosModel.fromAPI2App(element));

      });

    });
    return categoryWallpapersListCars;


  }
  loadCategoryResultsMoreForCars(String cars) async {
    page = page + 1;
    String url = "https://api.pexels.com/v1/search?query=$cars&per_page=30&page=" + page.toString();
    await http.get(Uri.parse(url), headers: {'Authorization': 'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}).then((value) {
      Map result = jsonDecode(value.body);
      List images = result['photos'];
      images.forEach((element) {
        categoryWallpapersListCars.add(PhotosModel.fromAPI2App(element));
      });
    });
  }
  static selectedCategoryMountains(String mountains)async{
    await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$mountains=&per_page=30'),

        headers: {'Authorization':'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}

    ).then((value){
      Map result = jsonDecode(value.body);

      List images = result['photos'];
      categoryWallpapersListMountains.clear();
      images.forEach((element) {
        categoryWallpapersListMountains.add(PhotosModel.fromAPI2App(element));

      });

    });
    return categoryWallpapersListMountains;


  }
  loadCategoryResultsMoreForMountains(String mountains) async {
    page = page + 1;
    String url = "https://api.pexels.com/v1/search?query=$mountains&per_page=30&page=" + page.toString();
    await http.get(Uri.parse(url), headers: {'Authorization': 'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}).then((value) {
      Map result = jsonDecode(value.body);
      List images = result['photos'];
      images.forEach((element) {
        categoryWallpapersListMountains.add(PhotosModel.fromAPI2App(element));
      });
    });
  }

  static selectedCategorySports(String sports)async{
    await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$sports=&per_page=30'),

        headers: {'Authorization':'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}

    ).then((value){
      Map result = jsonDecode(value.body);

      List images = result['photos'];
      categoryWallpapersListSports.clear();
      images.forEach((element) {
        categoryWallpapersListSports.add(PhotosModel.fromAPI2App(element));

      });

    });
    return categoryWallpapersListSports;


  }
  loadCategoryResultsMoreForSports(String sports) async {
    page = page + 1;
    String url = "https://api.pexels.com/v1/search?query=$sports&per_page=30&page=" + page.toString();
    await http.get(Uri.parse(url), headers: {'Authorization': 'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}).then((value) {
      Map result = jsonDecode(value.body);
      List images = result['photos'];
      images.forEach((element) {
        categoryWallpapersListSports.add(PhotosModel.fromAPI2App(element));
      });
    });
  }

  static selectedCategorySunsets(String sunsets)async{
    await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$sunsets=&per_page=30'),

        headers: {'Authorization':'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}

    ).then((value){
      Map result = jsonDecode(value.body);

      List images = result['photos'];
      categoryWallpapersListSunsets.clear();
      images.forEach((element) {
        categoryWallpapersListSunsets.add(PhotosModel.fromAPI2App(element));

      });

    });
    return categoryWallpapersListSunsets;


  }
  loadCategoryResultsMoreForSunsets(String sunsets) async {
    page = page + 1;
    String url = "https://api.pexels.com/v1/search?query=$sunsets&per_page=30&page=" + page.toString();
    await http.get(Uri.parse(url), headers: {'Authorization': 'OtFkiSnmSwZSDZT4cUCccxMGXqMxPJRGekvepWve7D4NhnjWYiM0zQdd'}).then((value) {
      Map result = jsonDecode(value.body);
      List images = result['photos'];
      images.forEach((element) {
        categoryWallpapersListSunsets.add(PhotosModel.fromAPI2App(element));
      });
    });
  }









































}
