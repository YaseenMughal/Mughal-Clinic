import 'package:flutter/material.dart';
import 'package:mughal_clinic/components/constant_component/color_constant.dart';

class AppButton {
  static mainButton(
    BuildContext context, {
    Color? btnColor,
    String? btnTxt,
    double? fontSize,
    Color? btnTxtColor,
    FontWeight? fontWeight,
    void Function()? onTap,
    EdgeInsetsGeometry? padding,
    double? height,
    double? width,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          height: height ?? MediaQuery.of(context).size.height * .05,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: btnColor ?? AppColor.titleColor,
          ),
          child: Center(
            child: Text(
              btnTxt.toString(),
              style: TextStyle(
                fontSize: fontSize ?? MediaQuery.of(context).size.width * 0.05,
                fontFamily: "Poppin",
                color: btnTxtColor ?? AppColor.btnTxtColor,
                fontWeight: fontWeight ?? FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static textButton({
    required void Function()? onTap,
    required String? text,
  }) {
    return TextButton(
      onPressed: onTap,
      child: Center(
        child: Text(
          text!,
          style: TextStyle(fontSize: 14, fontFamily: "Poppin", fontWeight: FontWeight.w400, color: AppColor.txtBtnColor),
        ),
      ),
    );
  }
}
