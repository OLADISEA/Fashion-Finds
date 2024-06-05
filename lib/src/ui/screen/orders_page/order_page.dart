import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/fashion_page/fashion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_details/order_details.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin {
  List<String> orders = ["1"];
  bool isActive = false;
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        margin: EdgeInsets.only(top: 71.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: reusableText(
                  text: "Orders",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700
              ),
            ),
            orders.isEmpty
                ? SizedBox(height: 216.h)
                : SizedBox(height: 40.h),
            orders.isEmpty
                ? emptyNotification(context)
                : Expanded(
              child: DefaultTabController(
                length: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          color: AppColor.splashScreenColor, // Active tab background color
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        labelColor: AppColor.whiteColor,
                        unselectedLabelColor: AppColor.blackColor,
                        isScrollable: true,
                        tabs: [
                          Tab(
                            child: Container(
                              width: 68.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                color: _currentIndex == 0 ? AppColor.splashScreenColor : AppColor.darkGrey,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Center(child: Text("Processing")),
                            ),
                          ),
                          Tab(
                            child: Container(
                              width: 68.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                color: _currentIndex == 1 ? AppColor.splashScreenColor : AppColor.darkGrey,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Center(child: Text("Shipped")),
                            ),
                          ),
                          Tab(
                            child: Container(
                              width: 68.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                color: _currentIndex == 2 ? AppColor.splashScreenColor : AppColor.darkGrey,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Center(child: Text("Delivered")),
                            ),
                          ),
                          Tab(
                            child: Container(
                              width: 68.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                color: _currentIndex == 3 ? AppColor.splashScreenColor : AppColor.darkGrey,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Center(child: Text("Returned")),
                            ),
                          ),
                          Tab(
                            child: Container(
                              width: 68.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                color: _currentIndex == 4 ? AppColor.splashScreenColor : AppColor.darkGrey,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Center(child: Text("Cancel")),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          showNotifications(context),
                          Center(child: Text('Tab 1 content')),
                          Center(child: Text('Tab 2 content')),
                          Center(child: Text('Tab 3 content')),
                          Center(child: Text('Tab 4 content')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyNotification(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("assets/icons/check-out.png"),
          SizedBox(height: 16.h),
          reusableText(text: "No Orders yet"),
          SizedBox(height: 16.h),
          submitButton(
            text: "Explore Categories",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FashionPage()),
              );
            },
            buttonColor: AppColor.splashScreenColor,
            size: 16.sp,
            width: 185.w,
          ),
        ],
      ),
    );
  }

  Widget showNotifications(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColor.darkGrey,
            ),
            margin: EdgeInsets.only(bottom: 10.h, left: 27.w, right: 27.w),
            child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OrderDetails()));
              },
              leading: Image.asset(
                "assets/icons/order.png",
                width: 40.w,
                height: 40.w,
              ),
              title: Container(
                width: 116.w,
                height: 20.h,
                child: reusableText(
                  text: "Order #456765",
                  fontSize: 16.sp,
                ),
              ),
              subtitle: reusableText(text: "4 Items",fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0XFF272727)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
