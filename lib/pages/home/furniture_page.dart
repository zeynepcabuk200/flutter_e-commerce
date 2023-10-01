//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uygulama1/widgets//small_text.dart';
import 'package:uygulama1/widgets//big_text.dart';
import 'package:uygulama1/utils//colors.dart';
import 'package:uygulama1/pages/home//furniture_page_body.dart';
import 'package:uygulama1/utils/dimansions.dart';

  class FurniturePage extends StatefulWidget {
  const FurniturePage({Key? key}) : super(key: key);

  @override
  State<FurniturePage> createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  @override
  Widget build(BuildContext context) {
    print("current height is"+MediaQuery.of(context).size.height.toString());//683.4
    print("current width is"+MediaQuery.of(context).size.width.toString());//411.4
    return Scaffold(
        body: Column(
          children: [
            //showing the header
            Container(
              child: Container(
                margin: EdgeInsets.only(top:Dimensions.height45, bottom:Dimensions.height15),                     //ekran kenar
                padding: EdgeInsets.only(left:Dimensions.width20, right:Dimensions.width20),                    //yazı ve kenar araaındaki uzaklık

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: " ", color:AppColors.mainColor),
                        Row(
                          children: [
                            SmallText(text: " ", color: Colors.black54,),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                        child: Container(
                          width: Dimensions.height45,
                          height: Dimensions.height45,
                          child: Icon(Icons.search, color: Colors.white,size:Dimensions.iconSize24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15),
                            color: Color(0xFFccccff),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
            //showing the body
            Expanded(child: SingleChildScrollView(
              child: FurniturePageBody(),
            )
            ),
          ],
        )
    );
  }


}
