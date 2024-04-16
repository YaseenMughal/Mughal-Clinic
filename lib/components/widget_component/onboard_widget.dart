// import 'package:flutter/material.dart';
// import 'package:mughal_clinic/components/constant_component/color_constant.dart';
// import 'package:mughal_clinic/components/widget_component/button_widget.dart';
// import 'package:mughal_clinic/view/login_view.dart';

// class OnboardWidget extends StatelessWidget {
//   static const routeName = "/onboard";
//   final String image;
//   final String title;
//   final String subTitle;
//   void Function() onTap;

//   OnboardWidget({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.subTitle,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             flex: 3,
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: Image.asset(
//                 image,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: MediaQuery.of(context).size.width * 0.05,
//                       fontFamily: "Poppin",
//                       color: AppColor.titleColor,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 10.0),
//                   Text(
//                     subTitle,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: MediaQuery.of(context).size.width * 0.030,
//                       fontFamily: "Poppin",
//                       color: AppColor.subtitleColor.withOpacity(0.8),
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   const SizedBox(height: 12.0),
//                   AppButton.mainButton(
//                     context,
//                     btnTxt: "Next",
//                     btnTxtColor: AppColor.btnTxtColor,
//                     btnColor: AppColor.titleColor,
//                     onTap: onTap,
//                   ),
//                   const SizedBox(height: 10.0),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pushReplacementNamed(LoginView.routeName);
//                     },
//                     child: Text(
//                       "Skip",
//                       style: TextStyle(
//                         fontSize: MediaQuery.of(context).size.width * 0.03,
//                         fontFamily: "Poppin",
//                         color: AppColor.subtitleColor.withOpacity(0.8),
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
