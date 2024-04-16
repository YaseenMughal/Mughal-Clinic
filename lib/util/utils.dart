import 'package:flutter/material.dart';

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
}
