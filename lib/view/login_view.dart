import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mughal_clinic/components/constant_component/color_constant.dart';
import 'package:mughal_clinic/components/constant_component/image_constant.dart';
import 'package:mughal_clinic/components/constant_component/text_constant.dart';
import 'package:mughal_clinic/components/widget_component/button_widget.dart';
import 'package:mughal_clinic/components/widget_component/textField_widget.dart';
import 'package:mughal_clinic/util/utils.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Widget mainTextWidget = AppText.mainText();

  final TextEditingController _tfcName = TextEditingController();
  final TextEditingController _tfcEmail = TextEditingController();
  final TextEditingController _tfcPassword = TextEditingController();

  // final _formKey = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  // getImage(ImageSource source, SelectedImageProvider imageProvider) async {
  //   final picker = ImagePicker();
  //   final pickImage = await picker.pickImage(source: source);
  //   if (pickImage != null) {
  //     File pickFile = File(pickImage.path);
  //     imageProvider.setSelectedImage(pickFile);
  //     print("Selected Image Successfully!");
  //   } else {
  //     print("No Selected Image!");
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    _tfcName.dispose();
    _tfcEmail.dispose();
    _tfcPassword.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0, bottom: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImage.appLogo),
                      mainTextWidget,
                      const SizedBox(height: 10.0),
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColor.titleColor,
                          fontFamily: "Poppin",
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "We are here to help you!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.subtitleColor,
                          fontFamily: "Poppin",
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      AppTextField.textfield(
                        text: "Your Name",
                        controller: _tfcName,
                        keyboard: TextInputType.name,
                        prefixIcon: const Icon(Icons.person_2_outlined),
                        focusnode: _nameFocusNode,
                        onFieldSubmittedValue: (newValue) {
                          Utils.fieldFocus(context, _nameFocusNode, _emailFocusNode);
                        },
                      ),
                      AppTextField.textfield(
                        text: "Your Email",
                        controller: _tfcEmail,
                        keyboard: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.mail_outline_rounded),
                        focusnode: _emailFocusNode,
                        onFieldSubmittedValue: (newValue) {
                          Utils.fieldFocus(context, _emailFocusNode, _passwordFocusNode);
                        },
                      ),
                      AppTextField.textfield(
                        text: "Password",
                        controller: _tfcPassword,
                        keyboard: TextInputType.visiblePassword,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        focusnode: _passwordFocusNode,
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppButton.mainButton(
                        context,
                        btnTxt: "Create Account",
                        btnTxtColor: AppColor.btnTxtColor,
                        btnColor: AppColor.titleColor,
                        height: MediaQuery.of(context).size.height * .065,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        onTap: () {},
                      ),
                      doubleDivider(),
                      authenticBox(image: AppImage.googleLogo, text: "Google", onTap: () {}),
                      authenticBox(image: AppImage.facebookLogo, text: "Facebook", onTap: () {}),
                      AppText.richTxt(
                        text01: "Do you have an account? ",
                        text02: "Sign In",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget doubleDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
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

  Widget authenticBox({String? image, String? text, void Function()? onTap}) {
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
                "Continue with ${text!}",
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
}
