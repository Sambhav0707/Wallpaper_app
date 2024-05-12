import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wallpaper_app/CONTROLLER/bottomnavbarcontroller.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {


  @override
  Widget build(BuildContext context) {
    BottomNavBarController controller = Get.put(BottomNavBarController());
    return  Scaffold(
      bottomNavigationBar:  Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GNav(



            rippleColor: Colors.grey.shade500,
            haptic: true,
            tabActiveBorder: Border.all(color: Colors.black, width: 1),
            tabBorder: Border.all(color: Colors.black, width: 1),
            iconSize: 26,
            tabBackgroundColor: Colors.blueGrey.shade100,
            color: Colors.blueGrey.shade400,
            activeColor: Colors.deepPurple,
            backgroundColor: Colors.black,
            gap: 8,
            padding: const EdgeInsets.all(10),
            onTabChange: (value){
              print(value);
              controller.index.value = value;

            },


            tabs: const [
              GButton(

                backgroundGradient: LinearGradient(
                  colors: [
                    Color(0xFFc79aae),
                    Colors.white54,
                  ],
                ),
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(

                backgroundGradient: LinearGradient(
                  colors: [
                    Color(0xFFc79aae),
                    Colors.white54,
                  ],
                ),
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(

                backgroundGradient: LinearGradient(
                  colors: [
                    Color(0xFFc79aae),
                    Colors.white54,
                  ],
                ),
                icon: Icons.favorite,
                text: 'Favorite',
              ),
            ],



          ),

        ),
      ),
      body: Obx(()=>controller.pages[controller.index.value],),
      backgroundColor: Colors.black26,
    );
  }
}
