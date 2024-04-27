//
//
//
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:wallpaper_app/CONTROLLER/apiOps.dart';
// import 'package:wallpaper_app/MODEL/photosModel.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//    late List<PhotosModel> trendingLists=[];
//
//
//   GetTrendingWallpapers() async{
//     trendingLists = await  ApiOperations.getTrendingWallpapers();
//
//     setState() {
//       // TODO: implement setState
//
//     }
//
//   }
//
//
//
//
//
//   @override
//   void initState(){
//     super.initState();
//
//     GetTrendingWallpapers();
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.white54,
//         // flexibleSpace: Container(
//         //   decoration: const BoxDecoration(
//         //     gradient: LinearGradient(
//         //       colors: [
//         //         Color(0xFFc79aae),
//         //         Colors.white54,
//         //
//         //       ]
//         //     )
//         //   ),
//         // ),
//
//
//         // elevation: 8,
//         title: const Text('og wallpapers'),
//
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             _scaffoldKey.currentState!.openDrawer(); // Open the drawer
//           },
//           icon: const Icon(Icons.account_circle_outlined),
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: const [
//             DrawerHeader(child: Text('drawer')),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               height: MediaQuery.of(context).size.height,
//
//               child: GridView.builder(
//                 physics: const BouncingScrollPhysics(),
//
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 5,
//                   mainAxisSpacing: 5,
//                   mainAxisExtent: 300,
//                 ),
//                 itemCount: trendingLists.length,
//                 itemBuilder: ((context,index) => Container(
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade700,),
//                   height: 300,
//                   width: (MediaQuery.of(context).size.width - 20 - 5 * 3) / 2,
//                   child:
//
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.network(
//
//
//
//                       fit: BoxFit.cover,
//                       trendingLists[index].imgSrc,
//                     ),
//                   ),
//
//                 )
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar:   Container(
//         color: Colors.black,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
//           child: GNav(
//             // rippleColor: Colors.grey.shade500,
//             haptic: true,
//             tabActiveBorder: Border.all(color: Colors.black,width: 1),
//             tabBorder: Border.all(color: Colors.black,width: 1),
//             iconSize: 26,
//             tabBackgroundColor: Colors.blueGrey.shade100,
//             color: Colors.blueGrey.shade400,
//             activeColor: Colors.deepPurple,
//             backgroundColor: Colors.black,
//
//
//
//
//             gap: 8,
//             padding: const EdgeInsets.all(10),
//             tabs:  const [
//               GButton(
//                 backgroundGradient: LinearGradient(
//                     colors: [
//                       Color(0xFFc79aae),
//                       Colors.white54,
//                     ]),
//
//
//                   icon: Icons.home,
//                   text: 'Home',
//               ),
//               GButton(
//                 backgroundGradient: LinearGradient(
//                     colors: [
//                       Color(0xFFc79aae),
//                       Colors.white54,
//                     ]),
//                 icon: Icons.search,
//                 text: 'Search',
//               ),
//               GButton(
//                 backgroundGradient: LinearGradient(
//                     colors: [
//                 Color(0xFFc79aae),
//                 Colors.white54,
//               ]),
//                 icon: Icons.favorite,
//                 text: 'Favorite',
//               ),
//
//             ],
//
//           ),
//         ),
//       ),
//       backgroundColor: Colors.black26,
//     );
//   }
// }
//

//
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:wallpaper_app/CONTROLLER/apiOps.dart';
// import 'package:wallpaper_app/MODEL/photosModel.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   late List<PhotosModel> trendingLists ;
//
//   GetTrendingWallpapers() async {
//     trendingLists = await ApiOperations.getTrendingWallpapers();
//
//     setState(() {
//       // Update the state after fetching data
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     GetTrendingWallpapers();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: Drawer(
//         child: ListView(
//           children: const [
//             DrawerHeader(child: Text('drawer')),
//           ],
//         ),
//       ),
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             backgroundColor: Colors.white,
//             title: const Text('og wallpapers'),
//             centerTitle: true,
//             leading: IconButton(
//               onPressed: () {
//                 _scaffoldKey.currentState!.openDrawer();
//               },
//               icon: const Icon(Icons.account_circle_outlined),
//             ),
//             floating: true, // App bar will float as you scroll down
//             snap: false, // App bar will snap into view when scrolled down
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.all(10),
//             sliver: SliverGrid(
//
//
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 5,
//                 mainAxisSpacing: 5,
//                 mainAxisExtent: 300,
//               ),
//               delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.grey.shade700,
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.network(
//                         trendingLists[index].imgSrc,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//                 childCount: trendingLists.length,
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         color: Colors.black,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//           child: GNav(
//             rippleColor: Colors.grey.shade500,
//             haptic: true,
//             tabActiveBorder: Border.all(color: Colors.black, width: 1),
//             tabBorder: Border.all(color: Colors.black, width: 1),
//             iconSize: 26,
//             tabBackgroundColor: Colors.blueGrey.shade100,
//             color: Colors.blueGrey.shade400,
//             activeColor: Colors.deepPurple,
//             backgroundColor: Colors.black,
//             gap: 8,
//             padding: const EdgeInsets.all(10),
//             tabs: const [
//               GButton(
//                 backgroundGradient: LinearGradient(
//                   colors: [
//                     Color(0xFFc79aae),
//                     Colors.white54,
//                   ],
//                 ),
//                 icon: Icons.home,
//                 text: 'Home',
//               ),
//               GButton(
//                 backgroundGradient: LinearGradient(
//                   colors: [
//                     Color(0xFFc79aae),
//                     Colors.white54,
//                   ],
//                 ),
//                 icon: Icons.search,
//                 text: 'Search',
//               ),
//               GButton(
//                 backgroundGradient: LinearGradient(
//                   colors: [
//                     Color(0xFFc79aae),
//                     Colors.white54,
//                   ],
//                 ),
//                 icon: Icons.favorite,
//                 text: 'Favorite',
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.black26,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart';
import 'package:wallpaper_app/CONTROLLER/apiOps.dart';

import 'package:wallpaper_app/MODEL/photosModel.dart';
import 'package:wallpaper_app/VIEW/SCREENS/favorite.dart';
import 'package:wallpaper_app/VIEW/SCREENS/fullscreen.dart';
import 'package:wallpaper_app/VIEW/SCREENS/search.dart';

import 'package:wallpaper_app/VIEW/WIDGETS/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   List<PhotosModel> trendingLists=[];
  final ShimmerWidget shimmerWidget = ShimmerWidget();
  final ApiOperations apiOperations = ApiOperations();
  final ScrollController _firstController = ScrollController();






  // ignore: non_constant_identifier_names
  Future<void>GetTrendingWallpapers() async {
    trendingLists = await ApiOperations.getTrendingWallpapers();

    setState(() {
      // Update the state after fetching data
    });
  }
  // ignore: non_constant_identifier_names
  Future<void>GetLoadMore() async {
    await apiOperations.loadMore();

    setState(() {


      // Update the state after fetching data
    });
  }

  @override
  void initState() {
    super.initState();
    GetTrendingWallpapers();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text('drawer')),
          ],
        ),
      ),
      body:
          // Obx( ()=> controller.pages[controller.index.value],),



      Stack(
        children:[ Scrollbar(
          thickness: 7,
          radius: Radius.circular(3),
          thumbVisibility:true,
           interactive: true,
          showTrackOnHover: true,
          trackVisibility: true,




          controller: _firstController,
          child: CustomScrollView(






            slivers: <Widget>[


              SliverAppBar(
                backgroundColor: Colors.white,
                title: const Text('og wallpapers'),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.account_circle_outlined),
                ),
                floating: true, // App bar will float as you scroll down
                snap: false, // App bar will not snap into view when scrolled down
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: trendingLists.isEmpty ? shimmerWidget.GetShimmerLoading() : SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 300,

                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {



                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(imgSrc: trendingLists[index].imgSrc)));
                        },
                        child: Hero(
                          tag: trendingLists[index].imgSrc,
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade700,
                            ),
                            child: ClipRRect(

                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(

                                trendingLists[index].imgSrc,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: trendingLists.length,

                  ),


                ),

              ),

            ],
            controller: _firstController,

          ),
        ),
          Positioned(
            bottom: 20.0, // Adjust for desired placement
            left: 0.0, // Place at left edge
            right: 0.0, // Place at right edge
            child: Center( // Center the button horizontally
              child: Material(
                color: Colors.transparent, // Remove default background color
                borderRadius: const BorderRadius.all(Radius.circular(20.0)), // Curved edges


                child: InkWell(
                  onTap: (){
                      GetLoadMore();
                  },
                  child: Container(
                       decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)), // Curved edges
                        gradient: LinearGradient(
                          colors:[
                            Color(0xFFc79aae),
                            Colors.white54,
                          ]
                        ),
                      ),
                      width: 100.0,
                      height: 40.0,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text('Load More',
                          style: TextStyle(fontSize: 15, color: Colors.deepPurple)),
                    ),

                  ),
                ),
              ),
            ),
          ),
        ]

      ),



      // bottomNavigationBar:

      // Container(
      //   color: Colors.black,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      //     child: GNav(
      //
      //
      //       rippleColor: Colors.grey.shade500,
      //       haptic: true,
      //       tabActiveBorder: Border.all(color: Colors.black, width: 1),
      //       tabBorder: Border.all(color: Colors.black, width: 1),
      //       iconSize: 26,
      //       tabBackgroundColor: Colors.blueGrey.shade100,
      //       color: Colors.blueGrey.shade400,
      //       activeColor: Colors.deepPurple,
      //       backgroundColor: Colors.black,
      //       gap: 8,
      //       padding: const EdgeInsets.all(10),
      //
      //
      //       tabs: const [
      //         GButton(
      //           backgroundGradient: LinearGradient(
      //             colors: [
      //               Color(0xFFc79aae),
      //               Colors.white54,
      //             ],
      //           ),
      //           icon: Icons.home,
      //           text: 'Home',
      //         ),
      //         GButton(
      //
      //           backgroundGradient: LinearGradient(
      //             colors: [
      //               Color(0xFFc79aae),
      //               Colors.white54,
      //             ],
      //           ),
      //           icon: Icons.search,
      //           text: 'Search',
      //         ),
      //         GButton(
      //
      //           backgroundGradient: LinearGradient(
      //             colors: [
      //               Color(0xFFc79aae),
      //               Colors.white54,
      //             ],
      //           ),
      //           icon: Icons.favorite,
      //           text: 'Favorite',
      //         ),
      //       ],
      //
      //
      //
      //     ),
      //
      //   ),
      // ),
      backgroundColor: Colors.black26,


    );
  }
}

