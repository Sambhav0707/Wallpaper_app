import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/CONTROLLER/apiOps.dart';

import 'package:wallpaper_app/MODEL/photosModel.dart';
import 'package:wallpaper_app/VIEW/AUTHENTIFICATION/login_screen.dart';
import 'package:wallpaper_app/VIEW/SCREENS/fullscreen.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/coustom_appbar.dart';

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






  Future<void>GetTrendingWallpapers() async {
    trendingLists = await ApiOperations.getTrendingWallpapers();

    setState(() {
    });
  }

  Future<void>GetLoadMore() async {
    await apiOperations.loadMore();

    setState(() {



    });
  }

  @override
  void initState() {
    super.initState();
    GetTrendingWallpapers();
  }
   signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      // Replace '/' with the route name of your login screen or home screen
    } catch (e) {
      print('Error signing out: $e');
      // Handle sign out errors if any
    }
  }
 deleteUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final FirebaseAuth auth = FirebaseAuth.instance;
      final currentUser = auth.currentUser;
      final userEmail = currentUser!.email;


      await FirebaseFirestore.instance.collection(userEmail!).doc('favorites').delete();

      await user!.delete();

    } catch (e) {
      print('Error deleting user: $e');
    }
  }
  showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteUser();
                Navigator.of(context).pop();// Close the dialog after deleting the user
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  showSignoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Signout '),
          content: Text('Are you sure you want to Signout ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                signOutUser();
                Navigator.of(context).pop();// Close the dialog after deleting the user
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(

          children: [
            // DrawerHeader(child: Text('drawer')),
            ListTile(
              leading: Icon(Icons.logout),
              title: Center(child: Text('sign out')),

              onTap: (){
                showSignoutConfirmationDialog();


              },

            ),
            ListTile(selectedTileColor: Colors.deepPurple.shade100,

              leading: Icon(Icons.delete),
              title: Center(child: Text('delete acount')),
              onTap: (){
                showDeleteConfirmationDialog();

              },

            )
          ],
        ),
      ),
      body: Stack(
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

                title: CoustomAppbar(),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.settings,color: Colors.deepPurple,),
                ),
                floating: true,
                snap: false,
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
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Material(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),


                child: InkWell(
                  onTap: (){
                      GetLoadMore();
                  },
                  child: Container(
                       decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
      backgroundColor: Colors.black26,


    );
  }
}

