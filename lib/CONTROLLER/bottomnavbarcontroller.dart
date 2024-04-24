import 'package:get/get.dart';
import 'package:wallpaper_app/VIEW/SCREENS/favorite.dart';
import 'package:wallpaper_app/VIEW/SCREENS/home.dart';
import 'package:wallpaper_app/VIEW/SCREENS/search.dart';
class BottomNavBarController extends GetxController{
  RxInt index = 0.obs;

   var pages =[
     HomePage(),
     SearchScreen(),
     FavoriteScreen(),
   ];
}