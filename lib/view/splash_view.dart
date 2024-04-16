import 'package:flutter/material.dart';
import 'package:mughal_clinic/components/constant_component/color_constant.dart';
import 'package:mughal_clinic/components/constant_component/image_constant.dart';
import 'package:mughal_clinic/components/constant_component/text_constant.dart';
import 'package:mughal_clinic/components/widget_component/button_widget.dart';
import 'package:mughal_clinic/components/widget_component/onboard_widget.dart';
import 'package:mughal_clinic/provider/splash_provider.dart';
import 'package:mughal_clinic/view/login_view.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  static const routeName = "/";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.of(context).pushReplacementNamed(OnboardingView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Image.asset(
        "assets/images/splash_image.png",
        fit: BoxFit.fill,
      ),
    );
  }
}

class OnboardingView extends StatelessWidget {
  static const routeName = "/onboard";
  OnboardingView({super.key});

  final PageController _pageController = PageController();

  final List<Map<String, String>> splashData = [
    {"image": AppImage.womenDoctor1, "title": AppText.onBoardTitle01, "subTitle": AppText.onBoardSubtitle01},
    {"image": AppImage.womenDoctor9, "title": AppText.onBoardTitle02, "subTitle": AppText.onBoardSubtitle02},
    {"image": AppImage.manDoctor9, "title": AppText.onBoardTitle03, "subTitle": AppText.onBoardSubtitle03},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SplashProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) => value.setCurrentPage(index),
                  itemCount: splashData.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        splashData[value.currentPage]["image"]!,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        splashData[value.currentPage]["title"]!,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.052,
                          fontFamily: "Poppin",
                          color: AppColor.titleColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        splashData[value.currentPage]["subTitle"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.033,
                          fontFamily: "Poppin",
                          color: AppColor.subtitleColor.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      AppButton.mainButton(
                        context,
                        btnTxt: "Next",
                        btnTxtColor: AppColor.btnTxtColor,
                        btnColor: AppColor.titleColor,
                        height: MediaQuery.of(context).size.height * .065,
                        width: MediaQuery.of(context).size.width * .77,
                        padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
                        onTap: () {
                          int nextPage = value.currentPage + 1;
                          if (nextPage < splashData.length) {
                            value.setCurrentPage(nextPage);
                          } else {
                            Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => AnimatedContainer(
                              height: value.currentPage == index ? 9 : 6,
                              width: value.currentPage == index ? 26 : 8,
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  color: value.currentPage == index ? AppColor.titleColor : AppColor.subtitleColor.withOpacity(0.8), borderRadius: BorderRadius.circular(3.0)),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (value.currentPage == 0) {
                            Navigator.of(context).popUntil((route) => route.isFirst);
                          } else if (value.currentPage == 1) {
                            value.setCurrentPage(0);
                          } else if (value.currentPage == 2) {
                            value.setCurrentPage(1);
                          }
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontFamily: "Poppin",
                            color: AppColor.subtitleColor.withOpacity(0.8),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
