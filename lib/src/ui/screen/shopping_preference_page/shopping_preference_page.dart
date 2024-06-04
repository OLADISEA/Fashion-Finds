import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_page/home_page.dart';

class ShoppingPreferencePage extends StatefulWidget {
  const ShoppingPreferencePage({super.key});

  @override
  State<ShoppingPreferencePage> createState() => _ShoppingPreferencePageState();
}

class _ShoppingPreferencePageState extends State<ShoppingPreferencePage> {
   bool isPreferenceMen = true;
   bool isPreferenceWomen = false;
   String? selectedAgeRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 24.w,top: 161.h,right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reusableText(text: "Tell us About Yourself",fontWeight: FontWeight.w700,fontSize: 24.sp),
                SizedBox(height: 49.h,),
                reusableText(text: "who do you shop for ?",fontSize: 16.sp,color: AppColor.blackShade),
                SizedBox(height: 22.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    shoppingPreference(
                        text: "Men",
                        isMan: isPreferenceMen,
                        isWoman: isPreferenceWomen,
                        onTap:  () {
                          setState(() {

                            isPreferenceMen = true;
                            isPreferenceWomen = false;
                            print(isPreferenceMen);
                          });

                    }
                    ),
                    SizedBox(width: 20.w,),
                    shoppingPreference(
                        text: "Women",
                        isMan: isPreferenceMen,
                        isWoman: isPreferenceWomen,
                        onTap:  () {
                          setState(() {
                            isPreferenceMen = false;
                            isPreferenceWomen = true;
                          });

                        }
                    )

                  ],
                ),
                SizedBox(height: 56.h,),
                reusableText(text: "How Old are You ?",fontSize: 16.sp),
                SizedBox(height: 13.h,),
                ageRangeDropDown(
                  selectedAgeRange: selectedAgeRange,
                  onChanged: (newValue) {
                    setState(() {
                      selectedAgeRange = newValue;
                    });
                  },
                ),

              ],
            ),
          ),
          SizedBox(height: 266.h,),
          Container(
            width: 390.w,
            height: 88.h,
            decoration: const BoxDecoration(
              color: AppColor.darkGrey,
            ),
            child: Center( // Center the inner container within the outer container
              child: submitButton(text: "Finish", onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
              },height: 52.h,width: 344.w,buttonColor: AppColor.splashScreenColor)
            ),
          )
        ],
      ),
    );
  }
}
