import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/fashion_page/fashion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({Key? key}) : super(key: key);

  List<String> notifications = ["1"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        margin: EdgeInsets.only(top: 71.h),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            reusableText(text: "Notifications",fontSize: 16.sp,fontWeight: FontWeight.w700),
            notifications.isEmpty
                ?SizedBox(height: 204.h,)
                :SizedBox(height: 40.h,),
            notifications.isEmpty
                ?emptyNotification(context)
                :showNotifications(context)
          ],
        ),
      ),
    );
  }

  Widget emptyNotification(BuildContext context){
    return Center(
      child: Column(
        children: [
          Image.asset("assets/icons/bell.png"),
          SizedBox(height: 16.h,),
          reusableText(text: "No Notifications yet"),
          SizedBox(height: 16.h,),

          submitButton(
              text: "Explore Categories",
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FashionPage()));
              },
              buttonColor: AppColor.splashScreenColor,
              size: 16.sp,width: 185.w
          )
        ],
      ),
    );
  }


  Widget showNotifications(BuildContext context){
    return Expanded(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context,index){
            return Container(
              decoration: BoxDecoration(
                color: AppColor.darkGrey
              ),
              margin: EdgeInsets.only(bottom: 10.h,left: 27.w,right: 27.w),
              child: ListTile(
                leading: Image.asset("assets/icons/notificationbing.png",width: 40.w,height: 40.w,),
                title: Container(
                  width: 232.w,
                  height: 38.h,
                  child: reusableText(
                      text: "Gilbert, you placed an order. Check your order history for full details",
                      fontSize: 12.sp),
                ),
              ),
            );
          }
      ),
    );

  }
}
