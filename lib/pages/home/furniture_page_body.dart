import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uygulama1/controllers/popular_product_controller.dart';
import 'package:uygulama1/pages/furniture/popular_furniture_detail.dart';
import 'package:uygulama1/routes/route_helper.dart';
import 'package:uygulama1/utils/colors.dart';
import 'package:uygulama1/widgets/big_text.dart';
import 'package:uygulama1/widgets/small_text.dart';
import 'package:uygulama1/widgets/icon_and_text_widget.dart';
import 'package:uygulama1/utils/dimansions.dart';
import 'package:uygulama1/widgets/app_column.dart';
import 'package:uygulama1/models/products_model.dart';
import 'package:uygulama1/utils/app_constants.dart';

import 'package:uygulama1/controllers/recommended_product_controller.dart';

class FurniturePageBody extends StatefulWidget {
  const FurniturePageBody({Key? key}) : super(key: key);

  @override
  State<FurniturePageBody> createState() => _FurniturePageBodyState();
}

class _FurniturePageBodyState extends State<FurniturePageBody> {
  PageController pageController=PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer; //kaydırılabilir olan
  @override
  void initState(){//başlatma
    super.initState();
    pageController.addListener(() {
    setState(()
     {
       _currPageValue = pageController.page!; //üst görsel büyük kalıyor
       // print("Şuan ki değer"+_currPageValue.toString());
      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts){
         return popularProducts.isLoaded?Container(
           // color: Colors.redAccent,
           height:Dimensions.pageView,


             child: PageView.builder( //kayan sayfa
                 controller: pageController,
                 itemCount: popularProducts.popularProductList.length, //üst görsel sayısını koyduk
                 itemBuilder: (context,position){
                   return _buildPageItem(position,popularProducts.popularProductList[position]);
                 }),
           
         ):CircularProgressIndicator(
           color: AppColors.mainColor,
         );
        }),
        //dots
        GetBuilder<PopularProductController>(builder:(popularProducts){
         return DotsIndicator(
           dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
           position: _currPageValue,
           decorator: DotsDecorator(
             activeColor: AppColors.mainColor,
             size: const Size.square(9.0),
             activeSize: const Size(18.0, 9.0),
             activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
           ),
         );
       }),
        //Popular text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text:"Önerilen"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color:Colors.black26),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: " ",),

              )
            ],
          ),
        ),
        //recommended furniture
        //list of furniture and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: ( context , index){
                return GestureDetector(
                  onTap:(){
                    Get.toNamed(RouteHelper.getRecommendedFurniture(index,"home "));
                  },
                  child: Container(

                    margin: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10 ),
                    child:  //bir widget ın içerisine başka bir widget ekleme

                    Row(
                      children: [
                        //image section
                        Container(
                          width:Dimensions.listViewImgSize,
                          height:Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                " "
                              //NetworkImage(
                              //  AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!
                              ),
                            ),
                          ),
                        ),
                        //text container
                        Expanded( //sağa doğru sonuna kadar kutucuk
                          child: Container(
                            height:Dimensions.listViewTextContSize,

                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight: Radius.circular(Dimensions.radius20), // soldan oval kısmı düzleştirdik

                              ),
                              color: Colors.white,

                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                  SizedBox(height: Dimensions.height10,),
                                  SmallText(text: "2000x1000 cm"),
                                  SizedBox(height: Dimensions.height10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndTextWidget(icon: Icons.circle_sharp,
                                        text   : " ",// ya da normal
                                        iconColor: AppColors.iconColor1,),
                                      IconAndTextWidget(icon: Icons.location_on,
                                        text: " ",
                                        iconColor: AppColors.mainColor,),
                                      //  IconAndTextWidget(icon: Icons.access_time_rounded,
                                      //  text   : "Max 3",//taşma yapıyor burayı düzelt
                                      //    iconColor: AppColors.iconColor2,),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );

              }):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        })

      ],
    );
  }
  Widget _buildPageItem(int index, ProductModel popularProduct){
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor() ){ 
      var  currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var  currTrans= _height*(1-currScale)/2;
      matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index==_currPageValue.floor()+1)
    {
      var currScale=_scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var  currTrans= _height*(1-currScale)/2;
      matrix= Matrix4.diagonal3Values(1,currScale,1);
      matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index==_currPageValue.floor()-1)
    {
      var  currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var  currTrans= _height*(1-currScale)/2;
      matrix= Matrix4.diagonal3Values(1,currScale,1);
      matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }
    else
    {
      var currScale=0.8;
      matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2,1);
    }
    return Transform(
      transform: matrix,
      child: Stack( //hizalama
        children: [
        GestureDetector(
          onTap: (){
            Get.toNamed(RouteHelper.getPopularFurniture(index,"home"));
          },
          child: Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: Dimensions.width10,right:Dimensions.width10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven?Color(0xFFfadfad): Color(0xFFccccff),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    " "
                  )
              )
          ),
          ),
        ),//iç içe container
          Align(//hizalama
            alignment: Alignment.bottomCenter,
          child: Container(
            height:Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(left:Dimensions.width30,right:Dimensions.width30, bottom:Dimensions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0),
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0),
                  )
                  ]
            ),
            child: Container(
              padding: EdgeInsets.only(top:Dimensions.height15,left:15,right:15), //bırakılan boşluklar
              child: AppColumn(text:popularProduct.name!),
          ),
          ),
    )
      ],
      ),
    );
  }
}




