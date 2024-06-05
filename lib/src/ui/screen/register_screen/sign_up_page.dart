import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/login_screen/login_page.dart';
import 'package:fashion_finds/src/ui/screen/shopping_preference_page/shopping_preference_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../forgot_password_page/forgot_password_page.dart';


class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        margin: EdgeInsets.only(top: 103.h,left: 27.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backArrow(context: context),
            SizedBox(
                height: 35.h,
                //width: 99.w,
                child: reusableText(
                  text: 'Create Account',
                  fontWeight: FontWeight.w700,
                  fontSize: 32.sp,

                )),
            SizedBox(height: 32.h,),
            myTextField(hintText: "Firstname", controller: firstNameController),
            SizedBox(height: 5.h,),
            myTextField(hintText: "Lastname", controller: lastNameController),
            SizedBox(height: 5.h,),
            myTextField(hintText: "Email Address", controller: emailController),
            SizedBox(height: 5.h,),
            myTextField(hintText: "Password", controller: passwordController),
            SizedBox(height: 10.h,),
            submitButton(text: "Continue",buttonColor: AppColor.splashScreenColor,onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ShoppingPreferencePage()));
            }),
            SizedBox(height: 10.h,),
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
                    text: "Already have an account?",
                    navigationText: "Sign In",
                    size: 18.sp,
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignInPage()));
                    }),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
