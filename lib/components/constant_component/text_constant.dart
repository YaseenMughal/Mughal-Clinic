import 'package:flutter/material.dart';
import 'package:mughal_clinic/components/constant_component/color_constant.dart';

class AppText {
  static const String onBoardTitle01 = "Meet Doctors Online";
  static const String onBoardTitle02 = "Connect with Specialists";
  static const String onBoardTitle03 = "Thousands of Online Specialists";
  static const String onBoardSubtitle01 = "Connect with Specialized Doctors Online for\nConvenient and Comprehensive Medical\nConsultations.";
  static const String onBoardSubtitle02 = "Connect with Specialized Doctors Online for\nConvenient and Comprehensive Medical\nConsultations.";
  static const String onBoardSubtitle03 = "Explore a Vast Array of Online Medical\nSpecialists, Offering an Extensive Range of\nExpertise Tailored to Your Healthcare Needs.";

  static mainText() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
      child: RichText(
          text: TextSpan(text: "Mughal", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400, color: AppColor.subtitleColor, fontFamily: "Poppin"), children: [
        TextSpan(
          text: "Clinic",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: AppColor.titleColor, fontFamily: "Poppin"),
        )
      ])),
    );
  }

  static richTxt({String? text01, String? text02, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
      child: InkWell(
        onTap: onTap,
        child: RichText(
            text: TextSpan(text: text01, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.subtitleColor, fontFamily: "Poppin"), children: [
          TextSpan(
            text: text02,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.txtBtnColor, fontFamily: "Poppin"),
          )
        ])),
      ),
    );
  }
}
