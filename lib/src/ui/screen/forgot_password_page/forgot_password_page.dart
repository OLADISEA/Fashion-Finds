import 'package:fashion_finds/src/ui/screen/reset_password_page/reset_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_colors/app_colors.dart';
import '../../common/widgets/widgets.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final TextEditingController passwordController = TextEditingController();

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
            myTextField(hintText: "Password", controller: passwordController),
            SizedBox(height: 10.h,),
            submitButton(text: "Continue",buttonColor: AppColor.splashScreenColor,onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ResetPasswordPage()));
            }),



          ],
        ),
      ),
    );
  }
}
