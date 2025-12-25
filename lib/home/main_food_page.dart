import 'package:ecommerce_app/home/food_page_body.dart';
import 'package:ecommerce_app/home/slider_body.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        ///Navbar
        Container(
          child: Container(
            margin: EdgeInsets.only(top: 60, bottom: 15),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

              Column(children: [

                BigText(text: 'Bangladesh', color: AppColors.primaryColor,),

                Row(children: [
                  SmallText(text: 'Noakhali', color: Colors.black54, size: 14,),
                  Icon(Icons.arrow_drop_down_rounded)
                ])

              ]),

              Container(width: 45, height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.primaryColor,),
                child: Icon(Icons.search_sharp, color: Colors.white,),
              )
            ]),
          ),
        ),

        ///body
        SliderBody(),
      ])
    );
  }
}
