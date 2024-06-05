import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/orders_page/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        margin: EdgeInsets.only(top: 63.h,left: 27.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titlePage(context),
            SizedBox(height: 20.h,),
            shippingDetails(isDone: true, text: "Delivered", date: "28 May"),
            shippingDetails(isDone: false, text: "Shipped", date: "28 May"),
            shippingDetails(isDone: false, text: "Order Confirmed", date: "28 May"),
            shippingDetails(isDone: false, text: "Order Placed", date: "28 May"),
            reusableText(text: "Order Items",fontSize: 16.sp),
            SizedBox(height: 16.sp,),
            Container(
              height: 72.h,
              decoration: const BoxDecoration(
                color: AppColor.darkGrey
              ),
              child: Center(
                child: ListTile(
                  leading: Image.asset("assets/icons/order.png"),
                  title: reusableText(text: "4 items"),
                  trailing: myTextButton(
                      text: "View All",
                      onTap: (){},
                      color: AppColor.splashScreenColor,
                      size: 12.sp),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            reusableText(text: "Shipping details",fontSize: 16.sp),
            SizedBox(height: 16.sp,),
            Container(
              padding: EdgeInsets.only(left: 11.w,top: 11.h),
              width: 342.w,
              height: 72.h,
              decoration: const BoxDecoration(
                  color: AppColor.darkGrey
              ),
              child: SizedBox(
                  width: 231.w,
                  height: 42,
                  child: reusableText(
                      text: "tehdu d hfd wdwj x  aoeygs x sccehe  yfejis uux",
                    fontSize: 12.sp
                  ))
            )

          ],
        ),
      ),
    );
  }
}
