import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';





class ShimmerWidget{
  GetShimmerLoading(){
    Shimmer(
      duration: const Duration(seconds: 3), //Default value
      interval: const Duration(seconds: 5), //Default value: Duration(seconds: 0)
      color: Colors.purple, //Default value
      colorOpacity: 0, //Default value
      enabled: true, //Default value
      direction: const ShimmerDirection.fromLTRB(),
      child:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade700,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const SizedBox()
        ),
      ),
    );

  }
}