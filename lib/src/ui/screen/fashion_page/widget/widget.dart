import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget homeHeader(){
  return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40.w,
            width: 40.w,
            child: CircleAvatar(
              radius: 30.r,
              backgroundImage: const AssetImage("assets/images/user-image.png"),
            ),
          ),

          Flexible(
            child: SizedBox(
              width: 102.w,
              height: 50.h,
              child: userPreference(selectedPreference: "Men", onChanged: (value){})
            ),
          ),

          Container(
            width: 40.w,
            height: 40.w,
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColor.splashScreenColor,
              child: Image.asset("assets/icons/vect.png"),
              //backgroundImage: const AssetImage("assets/icons/vect.png"),
            ),
          )
        ],
      ));
}

Widget userPreference({required String? selectedPreference, required Function(String?) onChanged}){
  final List<String> preference = [
    'Men',
    'Women',
  ];

  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r)
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r)
        ),
        filled: true,
        fillColor: AppColor.darkGrey,
        border: InputBorder.none
    ),
    value: selectedPreference,
    items: preference.map((String ageRange) {
      return DropdownMenuItem<String>(
        value: ageRange,
        child: reusableText(text: ageRange,fontSize: 12.sp),
      );
    }).toList(),
    onChanged: onChanged,
    validator: (value) => value == null ? 'Pick a choice' : null,
  );
}


Widget searchTextField({required String text,required TextEditingController controller}){
  return Container(
    decoration: BoxDecoration(
        color: AppColor.darkGrey,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
        color: AppColor.darkGrey
      )
    ),
    margin: EdgeInsets.only(top: 24.h),
    padding: EdgeInsets.only(left: 10.w),
    width: 342.w,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: text,
        icon: Icon(Icons.search_rounded)
      ),
    ),
  );
}

Widget categories({required String title, required String title2}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      reusableText(text: title,fontWeight: FontWeight.w700,fontSize: 16.sp),
      myTextButton(text: title2, onTap: (){},size: 16.sp,fontWeight: FontWeight.w400)
    ],
  );
}