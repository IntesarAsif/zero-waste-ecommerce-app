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
  double _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    pageController.addListener((){
      setState(() {
        _currentPageValue = pageController.page!;
        print('Current page value is ---------- ${_currentPageValue.toString()}');
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

    Matrix4 matrix = Matrix4.identity();  //3 coordinates: x,y,z

    if (index == _currentPageValue.floor()) {
      double currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      double currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    }
    // Logic for the next page
    else if (index == _currentPageValue.floor() + 1) {
      double currentScale = _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      double currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    }
    // Logic for the previous page
    else if (index == _currentPageValue.floor() - 1) {
      double currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      double currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    }
    // Logic for items further away (keeps them small and centered)
    else {
      double currentScale = 0.8;
      double currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [

        Container(
        height: 220,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven? Colors.greenAccent : Colors.redAccent,
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/image/food1.jpg"))
          ),
        ),

        Positioned(
          top: 170,
          left: 30,
          right: 30,
          child: Container(
            height: 110,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
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
      ]),
    );
  }
}
