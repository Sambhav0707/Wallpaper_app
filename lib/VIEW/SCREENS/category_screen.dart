import 'package:flutter/material.dart';
import 'package:wallpaper_app/CONTROLLER/apiOps.dart';
import 'package:wallpaper_app/MODEL/photosModel.dart';
import 'package:wallpaper_app/VIEW/SCREENS/fullscreen.dart';
import 'package:wallpaper_app/VIEW/WIDGETS/shimmer.dart';

class CategoryScreen extends StatefulWidget {
  String wildlife;
  CategoryScreen({super.key,required this.wildlife});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {


  final ApiOperations apiOperations = ApiOperations();
  final ShimmerWidget shimmerWidget = ShimmerWidget();

  List<PhotosModel> categoryResults=[];
  GetCategoryResults()async{
    categoryResults=await ApiOperations.selectedCategory(widget.wildlife);
    setState(() {

    });
  }
  @override
  void initState() {


    super.initState();
    GetCategoryResults();
  }
  Future<void>GetCatLoadMore() async {
    await apiOperations.loadCategoryResultsMore(widget.wildlife);

    setState(() {


      // Update the state after fetching data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[ Scrollbar(thickness: 7,radius: Radius.circular(3),thumbVisibility:true,
            interactive: true,

            controller: ScrollController(),
            child: CustomScrollView(





              slivers: <Widget>[



                SliverPadding(
                  padding: const EdgeInsets.all(10),
                  sliver: categoryResults.isEmpty ? shimmerWidget.GetShimmerLoading() : SliverGrid(
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> FullScreen(imgSrc: categoryResults[index].imgSrc)));
                          },
                          child: Hero(
                            tag: categoryResults[index].imgSrc,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade700,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  categoryResults[index].imgSrc,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: categoryResults.length,
                    ),
                  ),
                ),

              ],

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
                     GetCatLoadMore();
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
      backgroundColor: Colors.black26,
    );
  }
}
