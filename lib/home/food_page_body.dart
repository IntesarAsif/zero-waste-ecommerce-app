// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:ecommerce_app/utils/colors.dart';
// import 'package:ecommerce_app/widgets/big_text.dart';
// import 'package:ecommerce_app/widgets/icon_and_text_widget.dart';
// import 'package:ecommerce_app/widgets/small_text.dart';
// import 'package:flutter/material.dart';
//
// class FoodPageBody extends StatefulWidget {
//   const FoodPageBody({super.key});
//
//   @override
//   State<FoodPageBody> createState() => _FoodPageBodyState();
// }
//
// class _FoodPageBodyState extends State<FoodPageBody> {
//   PageController pageController = PageController(viewportFraction: 0.85);
//   double _currentPageValue = 0.0;
//   double _scaleFactor = 0.8;
//   double _height = 220;
//
//   @override
//   void initState() {
//     super.initState();
//     pageController.addListener(() {
//       setState(() {
//         _currentPageValue = pageController.page!;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 220,
//           child: PageView.builder(
//               controller: pageController,
//               itemCount: 6,
//               itemBuilder: (context, index) {
//                 return _buildPageItem(index);
//               }),
//         ),
//
//         DotsIndicator(
//           dotsCount: 5,
//           position: _currentPageValue,
//           decorator: DotsDecorator(
//             activeColor: AppColors.primaryColor,
//             size: const Size.square(9.0),
//             activeSize: const Size(18.0, 9.0),
//             activeShape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _buildPageItem(int index) {
//     Matrix4 matrix4 = Matrix4.identity();
//     if (index == _currentPageValue.floor()) {
//       double currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
//       double currentTransform = _height * (1 - currentScale) / 2;
//       matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
//         ..setTranslationRaw(0, currentTransform, 0);
//     } else if (index == _currentPageValue.floor() + 1) {
//       double currentScale =
//           _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
//       double currentTransform = _height * (1 - currentScale) / 2;
//       matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
//         ..setTranslationRaw(0, currentTransform, 0);
//     } else {
//       double currentScale = 0.8;
//       matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
//         ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
//     }
//
//     return Transform(
//       transform: matrix4,
//       child: Stack(children: [
//
//         Container(
//           height: 220,
//           margin: const EdgeInsets.symmetric(horizontal: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: Colors.black54,
//             image: const DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/image/food1.jpg")),
//           ),
//         ),
//
//         Align(
//           alignment: Alignment.bottomCenter,
//           // left: 20,
//           // right: 20,
//           // bottom: 0,
//           child: Container(
//             margin: EdgeInsets.only(left: 40, right: 40),
//             height: 120,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(color: const Color(0xFFe8e8e8), blurRadius: 5.0, offset: const Offset(0, 2)),
//                 const BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
//                 const BoxShadow(color: Colors.white, offset: Offset(5, 0)),
//               ],
//             ),
//             child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//                 BigText(text: "Chinese Side"),
//                 const SizedBox(height: 5),
//
//                 Row(children: [
//
//                   Wrap(
//                     children: List.generate(5, (index) =>
//                         Icon(Icons.star, color: AppColors.primaryColor, size: 15),),
//                   ),
//                   const SizedBox(width: 10),
//
//                   SmallText(text: '4.5'),
//                   const SizedBox(width: 10),
//
//                   SmallText(text: '1287 comments'),
//                 ]),
//                 const SizedBox(height: 5),
//
//                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//
//                   IconAndTextWidget(icon: Icons.circle, text: 'Normal', iconColor: AppColors.iconColor1,),
//                   IconAndTextWidget(icon: Icons.location_on_sharp, text: '1.7km', iconColor: AppColors.primaryColor),
//                   IconAndTextWidget(icon: Icons.access_time_outlined, text: '32min', iconColor: AppColors.iconColor2),
//
//                 ]),
//               ]),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
