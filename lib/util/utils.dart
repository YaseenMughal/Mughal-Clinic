import 'package:flutter/material.dart';
import 'package:mughal_clinic/components/constant_component/color_constant.dart';

class Utils {
  static Size sizeStyle(BuildContext context, {required double ratio}) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Size(width * ratio, height * ratio);
  }

  static void fieldFocus(BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static void appSnackbar({required BuildContext context, required String? text, Color? snackColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text!),
        backgroundColor: snackColor ?? AppColor.titleColor,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
