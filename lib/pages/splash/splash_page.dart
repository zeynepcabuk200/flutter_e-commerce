import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygulama1/utils/dimansions.dart';
import  'dart:async';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState(){
    /*
        AnyClass(){

         newObject(){
           return..
         }
        }
        var x= AnyClass()..newObject()
        x= x. newObject()
     */
     super.initState();
     _loadResource();
     controller=AnimationController(
         vsync: this,
         duration: const Duration(seconds: 2))..forward();
     //controller=controller.forward();
     animation= CurvedAnimation(
         parent: controller,
         curve: Curves.linear);

     Timer(
       const Duration(seconds: 3),
       ()=>Get.offNamed(RouteHelper.getInitial())
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale:animation,
          child:Center (child: Image.asset(" ",
            width: Dimensions.splashImg,))),
          Center (child: Image.asset("",
            width: Dimensions.splashImg,))
        ],
      )
    );
  }
}
