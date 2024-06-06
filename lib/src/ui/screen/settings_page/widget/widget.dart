import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget userInfo(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 24.w),
    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 13.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reusableText(text: "Gilbert Jones"),
            reusableText(text: "Gilbertjones001@gmail.com"),
            reusableText(text: "121-2247890")
          ],
        ),
        myTextButton(text: "Edit", onTap: (){},color: AppColor.splashScreenColor)
      ],
    ),
  );
}