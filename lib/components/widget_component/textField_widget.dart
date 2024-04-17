import 'package:flutter/material.dart';
import 'package:mughal_clinic/components/constant_component/color_constant.dart';

class AppTextField {
  static Padding textfield({
    required BuildContext context,
    required String text,
    Icon? prefixIcon,
    Icon? suffixIcon,
    Color? suffixIconColor,
    TextInputType? keyboard,
    required TextEditingController controller,
    String? Function(String?)? validator,
    FocusNode? focusnode,
    Color? focusColor,
    FormFieldSetter? onFieldSubmittedValue,
    int? minLines,
  }) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Padding(
      padding: EdgeInsets.only(top: height * .01, bottom: height * .01),
      child: TextFormField(
        style: TextStyle(fontSize: 15.0, color: AppColor.subtitleColor, fontFamily: "Poppin", fontWeight: FontWeight.w400),
        minLines: minLines,
        maxLines: null,
        controller: controller,
        focusNode: focusnode,
        onFieldSubmitted: onFieldSubmittedValue,
        keyboardType: keyboard,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.all(15.0),
            prefixIcon: prefixIcon,
            prefixIconColor: AppColor.subtitleColor,
            suffixIcon: suffixIcon,
            suffixIconColor: suffixIconColor ?? AppColor.subtitleColor,
            hintText: text,
            fillColor: Colors.white,
            filled: true,
            hintStyle: TextStyle(fontSize: 15.0, color: AppColor.subtitleColor.withOpacity(0.6), fontFamily: "Poppin", fontWeight: FontWeight.w400),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(width: 1)),
            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(width: 1, color: Color.fromARGB(255, 189, 189, 189))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 216, 216, 216),
                )),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(width: 1, color: AppColor.redColor)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(width: 2, color: focusColor ?? AppColor.subtitleColor))),
        validator: validator, // Set the validator function
      ),
    );
  }
}
