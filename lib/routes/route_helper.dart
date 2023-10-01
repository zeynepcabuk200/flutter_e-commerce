import 'package:get/get.dart';
import 'package:uygulama1/pages/cart/cart_page.dart';
import 'package:uygulama1/pages/furniture/popular_furniture_detail.dart';
import 'package:uygulama1/pages/furniture/recommended_furniture_detail.dart';
import 'package:uygulama1/pages/home/furniture_page.dart';
import 'package:uygulama1/pages/splash/splash_page.dart';

import '../pages/home/home_page.dart';

class RouteHelper{
  static const String splashPage="/splash-page";
  static const String initial="/";
  static const String popularFurniture="/popular-furniture";
  static const String recommendedFurniture="/recommended-furniture";
  static const String cartPage="/cart-page";


  static String getSplashPage()=>'$splashPage';
  static String getInitial()=>'$initial';
  static String getPopularFurniture(int pageId,String page)=>'$popularFurniture?pageId=$pageId&page=$page';
  static String getRecommendedFurniture(int pageId,String page)=>'$recommendedFurniture?pageId=$pageId&page=$page';
  static String getCartPage()=>'$cartPage';

  static List<GetPage> routes=[
     GetPage(name: splashPage, page: ()=>SplashScreen()),
     GetPage(name: initial, page: ()=>HomePage()),

     GetPage(name: popularFurniture, page: (){
       var pageId=Get.parameters['pageId'];
       var page=Get.parameters["page"];
       return PopularFurnitureDetail(pageId:int.parse(pageId!), page:page!);
     },
        transition: Transition.fadeIn
     ),
    GetPage(name: recommendedFurniture, page: (){
      var pageId=Get.parameters['pageId'];
      var page=Get.parameters["page"];

      return RecommendedFurnitureDetail(pageId:int.parse(pageId!),page:page!);
     },
        transition: Transition.fadeIn
     ),
    GetPage(name: cartPage, page: (){
      return CartPage();
    },
      transition: Transition.fadeIn,
    )
  ];
}