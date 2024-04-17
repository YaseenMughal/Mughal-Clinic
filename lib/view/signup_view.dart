import 'package:flutter/material.dart';
import 'package:mughal_clinic/components/constant_component/color_constant.dart';
import 'package:mughal_clinic/components/constant_component/image_constant.dart';
import 'package:mughal_clinic/components/constant_component/text_constant.dart';
import 'package:mughal_clinic/components/widget_component/app_widget.dart';
import 'package:mughal_clinic/components/widget_component/button_widget.dart';
import 'package:mughal_clinic/components/widget_component/textField_widget.dart';
import 'package:mughal_clinic/util/utils.dart';
import 'package:mughal_clinic/view/login_view.dart';

class SignUpView extends StatefulWidget {
  static const routeName = '/signup';

  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  Widget mainTextWidget = AppText.mainText();

  final TextEditingController _tfcName = TextEditingController();
  final TextEditingController _tfcEmail = TextEditingController();
  final TextEditingController _tfcPassword = TextEditingController();

  // final _formKey = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

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
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImage.appLogo),
                  mainTextWidget,
                  SizedBox(height: height * .02),
                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: AppColor.titleColor,
                      fontFamily: "Poppin",
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    "We are here to help you!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.subtitleColor,
                      fontFamily: "Poppin",
                    ),
                  ),
                  SizedBox(height: height * .02),
                  AppTextField.textfield(
                    context: context,
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
                    context: context,
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
                    context: context,
                    text: "Password",
                    controller: _tfcPassword,
                    keyboard: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    focusnode: _passwordFocusNode,
                  ),
                  AppButton.mainButton(
                    context,
                    btnTxt: "Create Account",
                    btnTxtColor: AppColor.btnTxtColor,
                    btnColor: AppColor.titleColor,
                    height: 48.0,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AppWidget.userInfo(
                            children: [
                              CircleAvatar(
                                radius: 55,
                                child: Image.asset(AppImage.profileLogo, fit: BoxFit.cover),
                              ),
                              AppTextField.textfield(
                                context: context,
                                text: "Your Name..",
                                controller: _tfcName,
                                keyboard: TextInputType.name,
                                prefixIcon: const Icon(Icons.person_2_outlined),
                                focusnode: _nameFocusNode,
                              ),
                              AppTextField.textfield(
                                context: context,
                                text: "name@example.com",
                                controller: _tfcEmail,
                                keyboard: TextInputType.emailAddress,
                                prefixIcon: const Icon(Icons.mail_outline_rounded),
                                focusnode: _emailFocusNode,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  AppWidget.doubleDivider(),
                  AppWidget.authenticBox(context: context, image: AppImage.googleLogo, text: "Continue with Google", onTap: () {}),
                  AppWidget.authenticBox(context: context, image: AppImage.facebookLogo, text: "Continue with Facebook", onTap: () {}),
                  AppText.richTxt(
                    text01: "Do you have an account? ",
                    text02: "Sign In",
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
