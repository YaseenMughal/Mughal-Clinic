import 'package:flutter/material.dart';
import 'package:mughal_clinic/components/constant_component/color_constant.dart';
import 'package:mughal_clinic/components/widget_component/onboard_widget.dart';
import 'package:mughal_clinic/provider/splash_provider.dart';
import 'package:mughal_clinic/view/login_view.dart';
import 'package:mughal_clinic/view/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SplashProvider()),
        ],
        child: MaterialApp(
          title: 'Mughal Clinic',
          theme: ThemeData(
            iconTheme: const IconThemeData(color: Color(0xff374151)),
            colorScheme: ColorScheme.fromSeed(seedColor: AppColor.titleColor),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            SplashView.routeName: (BuildContext context) => const SplashView(),
            OnboardingView.routeName: (BuildContext context) => OnboardingView(),
            LoginView.routeName: (BuildContext context) => const LoginView(),
          },
        ));
  }
}
