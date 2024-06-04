import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/login_screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/email_image.png"),
            Container(
              margin: EdgeInsets.only(left: 24.w,right: 24.w),
              child: Center(
                child: reusableText(
                    text: "We sent you an Email to reset your password",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            submitButton(
                text: "Return to Login",
                size: 16.sp,
                width: 159.w,
                height: 52.h,
                buttonColor: AppColor.splashScreenColor,
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInPage()));
            })
          ],
        ),
      ),
    );
  }
}
