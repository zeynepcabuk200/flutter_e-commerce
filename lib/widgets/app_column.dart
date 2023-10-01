import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uygulama1/utils/dimansions.dart';
import 'package:uygulama1/widgets/app_icon.dart';
import 'package:uygulama1/widgets/big_text.dart';
import 'package:uygulama1/widgets/small_text.dart';
import 'package:uygulama1/widgets/icon_and_text_widget.dart';
import 'package:uygulama1/utils/colors.dart';


class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,required this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text:text,size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) { return Icon(Icons.star,color:AppColors.mainColor, size:15);}),

            ),
            SizedBox(width: 10,),
            SmallText(text: "4.5"),
            SizedBox(width: 10,),
            SmallText(text: "1287"),
            SizedBox(width: 10,),
            SmallText(text: "yorumlar"),
          ],
        ),
        SizedBox(height: Dimensions.height20,),
        //time and distance
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           IconAndTextWidget(icon: Icons.circle_sharp,
             text   : "Normal",
            iconColor: AppColors.iconColor1,),
            IconAndTextWidget(icon: Icons.location_on,
              text: "İstanbul",
              iconColor: AppColors.mainColor,),
            IconAndTextWidget(icon: Icons.access_time_rounded,
              text   : "max 3 ",
              iconColor: AppColors.iconColor2,),

          ],
        )
      ],
    );
  }
}
