import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget titlePage(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      backArrow(context: context),
      SizedBox(width: 69.w),
      Center(
        child: reusableText(text: "Order #456765"),
      )
    ],
  );

}

Widget shippingDetails({required bool isDone,required String text, required String date}){
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    child: ListTile(
      leading: Container(
        height: 24.h,
        width: 24.w,
        decoration: BoxDecoration(
          color: isDone? AppColor.darkGrey: AppColor.splashScreenColor,
          shape: BoxShape.circle
        ),
        child: Image.asset("assets/icons/tick.png"),
      ),
      title: reusableText(text: text,fontSize: 16.sp,color: Color(0XFF272727)),
      trailing: reusableText(text: date,fontSize: 12.sp),
    ),
  );
}