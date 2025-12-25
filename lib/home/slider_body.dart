import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/icon_and_text_widget.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class SliderBody extends StatefulWidget {
  const SliderBody({super.key});

  @override
  State<SliderBody> createState() => _SliderBodyState();
}

class _SliderBodyState extends State<SliderBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currPageValue = 0.0;

  @override
  void initState() {
    pageController.addListener((){
      setState(() {
        _currPageValue = pageController.page!;
        print('Current Vale value is ---------- ${_currPageValue.toString()}');
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      height: 320,
      child: PageView.builder(
        controller: pageController,
          itemCount: 5,
          itemBuilder: (context, index){
        return _buildPageItem(index);
      }),
    );
  }

  Widget _buildPageItem (int index){
    return Stack(children: [
      Container(
      height: 220,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven? Colors.greenAccent : Colors.redAccent,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/image/food1.jpg")
          )
        ),
      ),
      Positioned(
        top: 170,
        left: 30,
        right: 30,
        child: Container(
          height: 110,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [

              BigText(text: "Bitter Orange Marinade"),

              Row(children: [
                Wrap(children: [
                  ...List.generate(5, (index) => Icon(Icons.star, color: AppColors.primaryColor, size: 15,))
                ]),

                Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SmallText(text: "4.5"),
                ),

                SmallText(text: "1287 comments")
              ]),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconAndTextWidget(icon: Icons.circle, text: "Normal", iconColor: AppColors.yellowColor),
                IconAndTextWidget(icon: Icons.location_on, text: "32 min", iconColor: AppColors.primaryColor),
                IconAndTextWidget(icon: Icons.access_time_outlined, text: "Normal", iconColor: AppColors.iconColor2),
              ],)
            ]),
          ),
        ),
      )
    ]);
  }
}
