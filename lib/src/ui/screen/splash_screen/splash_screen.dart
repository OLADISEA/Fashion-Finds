import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../login_screen/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    // Navigate after a delay
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.splashScreenColor,
      body: Center(
        child: Image.asset('assets/images/clot.png'),
        ),
      );
  }
}
