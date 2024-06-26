import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mughal_clinic/components/constant_component/color_constant.dart';
import 'package:mughal_clinic/components/constant_component/image_constant.dart';
import 'package:mughal_clinic/components/constant_component/text_constant.dart';
import 'package:mughal_clinic/components/widget_component/app_widget.dart';
import 'package:mughal_clinic/components/widget_component/button_widget.dart';
import 'package:mughal_clinic/components/widget_component/textField_widget.dart';
import 'package:mughal_clinic/util/utils.dart';
import 'package:mughal_clinic/view/signup_view.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Widget mainTextWidget = AppText.mainText();

  final TextEditingController _tfcEmail = TextEditingController();
  final TextEditingController _tfcPassword = TextEditingController();

  // final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _tfcEmail.dispose();
    _tfcPassword.dispose();
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
                    "Hi, Welcome Back!",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: AppColor.titleColor,
                      fontFamily: "Poppin",
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    "Hope you're doing fine.",
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
                    btnTxt: "Sign In",
                    btnTxtColor: AppColor.btnTxtColor,
                    btnColor: AppColor.titleColor,
                    height: 48.0,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    onTap: () {},
                  ),
                  AppWidget.doubleDivider(),
                  AppWidget.authenticBox(context: context, image: AppImage.googleLogo, text: "Sign In with Google", onTap: () {}),
                  AppWidget.authenticBox(context: context, image: AppImage.facebookLogo, text: "Sign In with Facebook", onTap: () {}),
                  AppButton.textButton(onTap: () {}, text: "Forget password?"),
                  AppText.richTxt(
                    text01: "Don't have an account yet? ",
                    text02: "Sign Up",
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(SignUpView.routeName);
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
