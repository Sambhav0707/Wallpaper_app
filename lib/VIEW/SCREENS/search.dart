import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/CONTROLLER/apiOps.dart';
import 'package:wallpaper_app/MODEL/photosModel.dart';
import 'package:wallpaper_app/VIEW/SCREENS/category_screen.dart';
import 'package:wallpaper_app/VIEW/SCREENS/category_screen_cars.dart';
import 'package:wallpaper_app/VIEW/SCREENS/category_screen_mountains.dart';
import 'package:wallpaper_app/VIEW/SCREENS/category_screen_sports.dart';
import 'package:wallpaper_app/VIEW/SCREENS/category_screen_sunsets.dart';
import 'package:wallpaper_app/VIEW/SCREENS/searchresultscreen.dart';

class SearchScreen extends StatefulWidget {

   SearchScreen({super.key});



  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

//   final ApiOperations apiOperations = ApiOperations();
//
// late List<PhotosModel> searchResults;
// GetSearchResults()async{
//   searchResults=await ApiOperations.searchWallpapers(widget.query);
//   setState(() {
//
//   });
// }
// @override
//   void initState() {
//
//
//     super.initState();
//     GetSearchResults();
//   }
  List categoryImages = [

    'images/mountains.jpg',
    'images/sunsets.jpg',
    'images/wildlife.jpg',
    'images/cars.jpg',
    'images/sports.jpg',
  ];
 Widget BuildIamge(String imgUrl)=> Container(
   height: MediaQuery.of(context).size.height,
   width: MediaQuery.of(context).size.width,
   child: ClipRRect(borderRadius: BorderRadius.circular(20),
   child: Image.asset(imgUrl,fit: BoxFit.cover,)) ,

 );

  List<ImageProvider> precacheImages = [];

  @override
  void initState() {
    super.initState();

    // Preload images
    categoryImages.forEach((imageUrl) {
      precacheImages.add(AssetImage(imageUrl)); // Add AssetImage to precacheImages list
    });
  }


  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        title: const Text('DISCOVERY') ,
      ),

      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                gradient: const LinearGradient(




                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,




                    colors: [
                      Color(0xFFc79aae),
                      Colors.white54,

                    ]
                ),
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(25)
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Wallpapers",
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                suffixIcon: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchResultScreen(query: _searchController.text )));
                  },
                  child: const Icon(Icons.search_outlined),
                )

              ),
            ),
          ),
          SizedBox(
            width:double.infinity,
            height: 100,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 60,vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey,
                // gradient: const LinearGradient(
                //     begin: Alignment.centerRight,
                //     end: Alignment.centerLeft,
                //     colors: [
                //       Color(0xFF4D5862),
                //       Colors.white54,
                //
                //     ]
                // ),
                borderRadius: BorderRadius.circular(20)
              ),
                child: Center(child: Text('CATEGORIES',style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 25 ),))),
          ),
           Expanded(
             child: CarouselSlider.builder(itemCount: categoryImages.length,
                 itemBuilder: (context,index,realIndex){
               final imageUrl = categoryImages[index];
                return GestureDetector(
                  onTap: (){
                    if(index==0){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryuScreenMountains(mountains: 'mountains')));
                    } else if(index==1){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreenSunsets(sunsets: 'sunsets')));

                    }else if(index==2){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen(wildlife: 'wildlife')));
                    }else if(index==3){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreenCars(cars: 'cars')));
                    }else if (index==4){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreenSports(sports: 'sports')));
                    }

                  },
                  child: Container(
                    margin: EdgeInsets.all(20),

                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.8,
                    decoration: BoxDecoration(
                      // color: Colors.purple,
                      borderRadius: BorderRadius.circular(20)
                    ),


                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ClipRRect(

                        child: Image(
                          height: 100,
                          image: AssetImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ) ;
                 },
                 options: CarouselOptions(
                   height: MediaQuery.of(context).size.height,
                   viewportFraction: 1,
                   autoPlay: true,
                   scrollPhysics: BouncingScrollPhysics() ,
                   animateToClosest: true,

                   enlargeCenterPage: true,
                   enlargeStrategy: CenterPageEnlargeStrategy.height

                 )
             ),
           )


        ],

      ),


    ) ;
   
  }
}
