import 'package:flutter/material.dart';
import 'package:mughal_clinic/components/constant_component/color_constant.dart';

class AppWidget {
  static Widget doubleDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Divider(
              indent: 12.0,
              endIndent: 12.0,
              color: AppColor.greyColor,
            ),
          ),
          Text(
            "or",
            style: TextStyle(color: AppColor.subtitleColor, fontSize: 16),
          ),
          Expanded(
            child: Divider(
              indent: 12.0,
              endIndent: 12.0,
              color: AppColor.greyColor,
            ),
          )
        ],
      ),
    );
  }

  static Widget authenticBox({
    String? image,
    String? text,
    void Function()? onTap,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height * .065,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                width: 1.0,
                color: const Color.fromARGB(255, 216, 216, 216),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image!),
              const SizedBox(width: 10.0),
              Text(
                text!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor,
                  fontFamily: "Poppin",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget userInfo({List<Widget> children = const <Widget>[]}) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fill Your Profile",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
            color: AppColor.titleColor,
            fontFamily: "Poppin",
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
