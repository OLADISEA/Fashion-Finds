import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget userInfo(BuildContext context){
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.tertiary,

    ),
    margin: EdgeInsets.symmetric(horizontal: 24.w),
    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 13.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reusableText(text: "Gilbert Jones"),
            reusableText(text: "Gilbertjones001@gmail.com",color: Theme.of(context).colorScheme.onPrimary),
            reusableText(text: "121-224-7890")
          ],
        ),
        myTextButton(text: "Edit", onTap: (){},color: AppColor.splashScreenColor)
      ],
    ),
  );
}