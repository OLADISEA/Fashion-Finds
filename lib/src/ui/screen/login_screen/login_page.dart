import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../forgot_password_page/forgot_password_page.dart';
import '../register_screen/sign_up_page.dart';
import '../shopping_preference_page/shopping_preference_page.dart';


class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        margin: EdgeInsets.only(top: 123.h,left: 27.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 35.h,
                //width: 99.w,
                child: reusableText(
                    text: 'Sign in',
                    fontWeight: FontWeight.w700,
                    fontSize: 32.sp,

                )),
            SizedBox(height: 32.h,),
            myTextField(hintText: "Email", controller: emailController),
            SizedBox(height: 5.h,),
            myTextField(hintText: "Password", controller: passwordController),
            SizedBox(height: 10.h,),
            submitButton(text: "Continue",buttonColor: AppColor.splashScreenColor,onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ShoppingPreferencePage()));
            }),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.only(left:200.w,right: 24.w),
              child: loginInfo(
                  text: "Forgot Password?",
                  navigationText: "Reset",
                  size: 12.sp,
                  onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ForgotPasswordPage()));
              }),
            ),
            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.only(left: 50.w),
              child: Center(
                child: loginInfo(
                    text: "Don't have an account?",
                    navigationText: "Sign Up",
                    size: 18.sp,
                    onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpPage()));
                }),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
