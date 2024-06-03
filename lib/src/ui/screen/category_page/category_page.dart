import 'package:fashion_finds/src/models/category_model.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/items_page/items_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_colors/app_colors.dart';

class CategoryPage extends StatelessWidget {
  final List<CategoryModel> categoryList;
  const CategoryPage({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        margin: EdgeInsets.only(top: 63.h,left: 27.w,right: 27.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backArrow(context: context),
            SizedBox(height: 16.sp,),

            reusableText(text: "Shop by Categories",fontSize: 24.sp,fontWeight: FontWeight.w700),
            SizedBox(height: 18.sp,),
            Expanded(
              child: ListView.builder(
                  itemCount: categoryList.length,
                  itemBuilder: (context,index){
                    return Container(
                      height: 64.h,
                      margin: EdgeInsets.only(bottom: 5.h),
                      decoration: BoxDecoration(
                        color: AppColor.darkGrey
                      ),
                      child: ListTile(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ItemsPage()));
                        },
                        leading: Image.asset("assets/images/categories/${categoryList[index].image}"),
                        title: Text(categoryList[index].name),
                      ),
                    );

              }),
            )
          ],
        ),
      ),
    );
  }
}
