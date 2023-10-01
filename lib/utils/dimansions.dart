import 'package:get/get.dart';
class Dimensions{

  static double screenHeight= Get.context!.height;
  static double screenWidth= Get.context!.width;

  static double pageView= screenHeight/2.34; //750/320-2.13
  static double pageViewContainer= screenHeight/3.4; //750/220-3.1 en son 3,4 tü
  static double pageViewTextContainer= screenHeight/6; //750/120-5.69 en son 6.25 di

  //dynamic height padding and margin
  static double height10= screenHeight/75; //750/10-68.3
  static double height15= screenHeight/50; //750/15-45.5
  static double height20= screenHeight/37.5; //750/20-34,15
  static double height30= screenHeight/25;//22,76
  static double height45= screenHeight/16.7;//15.15
  //dynamic width padding and margin
  static double width10= screenHeight/75; //750/10-68.3
  static double width15= screenHeight/50; //750/15-45.5
  static double width20= screenHeight/37.5; //750/20-34,15
  static double width30= screenHeight/25; //750/30-22.76

  //font size
  static double font16=screenHeight/46.9;//42,68
  static double font20= screenHeight/37.5;//34,15
  static double font26= screenHeight/28.84;//750/26-26.26

  //radius
  static double radius15= screenHeight/50; //750/15-45,53
  static double radius20= screenHeight/37.5;//34.15
  static double radius30= screenHeight/25; //750/30-22.76

  //icon size
  static double iconSize24= screenHeight/31.25 ;//750/24-28.45
  static double iconSize16= screenHeight/46.9;//42.68

 //list view size
  static double listViewImgSize= screenWidth/4.17;//500/120(boyutu 120 ye göre ayarlasın istiyoruz)-3.42
  static double listViewTextContSize= screenWidth/5;//500/100()-4.11

 //popular furniture
  static double popularFurnitureImgSize= screenHeight/2.14;//750/350-1.95

//bottom height
static double bottomHeightBar= screenHeight/6.25;//750/120-5.69



//splash screen dimensions
static double splashImg = screenHeight/2.80;//750/250



}