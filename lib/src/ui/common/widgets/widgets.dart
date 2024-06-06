import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget reusableText({required String text, double? fontSize, FontWeight? fontWeight, String? fontFamily,Color? color, TextAlign? textAlign}){
  return Text(text,textAlign: textAlign?? TextAlign.start,
    style: TextStyle(
      color: color?? Colors.black,
      fontSize: fontSize?? 20.sp,
      fontWeight: fontWeight?? FontWeight.w300,
      fontFamily: fontFamily?? "Circular std",

    ),
  );
}

Widget myTextField({
  required String hintText,
  required TextEditingController controller,
  void Function(String)? onChanged,
  bool? obscureText

}){
  return SizedBox(
    //padding: EdgeInsets.only(left: 12.w,top: 19.h),
    width: 342.w,
    height: 56.h,
    child: TextField(
      obscureText: obscureText?? false,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0XFFF4F4F4),
        border: InputBorder.none,
        disabledBorder: OutlineInputBorder(

          borderRadius: BorderRadius.circular(4.r)
        ),
        hintText: hintText
      ),
    ),
  );
}

Widget submitButton({
  required String text,
  double? height,
  double? width,
  double? size,
  Color? buttonColor,
  required void Function() onTap
}){
    return InkWell(
        onTap: onTap,
        child: Container(
          height: height??49.h,
          width: width??344.h,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(100.r)
          ),
          child: Center(child: reusableText(text: text,fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.white)
            )
        ),

    );
  }

Widget myTextButton({
  required String text,
  double? size,
  Color? color,
  FontWeight? fontWeight,
  required void Function() onTap}){
    return InkWell(
        onTap: onTap,
        child: reusableText(text: text,fontSize: size,fontWeight: fontWeight,color: color??Colors.black)
    );
}

Widget loginInfo({
  required String text,
  required String navigationText,
  double? size,
  required void Function() onTap
}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        reusableText(text: text,fontSize: size,fontWeight: FontWeight.w100),
        SizedBox(width: 5.sp,),
        myTextButton(
            text: navigationText,
            fontWeight: FontWeight.bold,
            size: size?? 12.sp,
            onTap:onTap,
            color: AppColor.splashScreenColor
        )
        ],
      );
}

Widget shoppingPreference({
  required String text,
  required bool isMan,
  required bool isWoman,
  required Function() onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 161.w,
      height: 52.h,
      decoration: BoxDecoration(
        color: isMan && text == "Men" || !isMan && text =="Women"?AppColor.splashScreenColor:AppColor.whiteColor,
        borderRadius: BorderRadius.circular(100.r)
      ),
      child: Center(child: reusableText(text: text,fontSize: 16.sp)),
    ),
  );
}

Widget ageRangeDropDown({required String? selectedAgeRange, required Function(String?) onChanged}) {
  final List<String> ageRanges = [
    'Under 18',
    '18-24',
    '25-34',
    '35-44',
    '45-54',
    '55-64',
    '65 and above',
  ];

  return SizedBox(
    //padding: const EdgeInsets.all(16.0),
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.r)
        ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0XFFF4F4F4)
            ),
              borderRadius: BorderRadius.circular(100.r)
          ),
        filled: true,
        fillColor: Color(0XFFF4F4F4),
        labelText: 'Age Range',
        labelStyle: TextStyle(
          fontFamily: 'Circular std',
          fontWeight: FontWeight.w400,
          fontSize: 16.sp
        ),
        border: InputBorder.none
      ),
      value: selectedAgeRange,
      items: ageRanges.map((String ageRange) {
        return DropdownMenuItem<String>(
          value: ageRange,
          child: Text(ageRange),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? 'Please select an age range' : null,
    ),
  );
}

Widget backArrow({required BuildContext context}){
  return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColor.darkGrey,
            shape: BoxShape.circle
          ),
          child: Image.asset("assets/icons/back-arrow.png")));
}
