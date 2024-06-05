import 'package:fashion_finds/src/models/category_model.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/items_page/items_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_colors/app_colors.dart';
import '../fashion_page/widget/widget.dart';

class CategoryPage extends StatefulWidget {
  final List<CategoryModel> categoryList;
  CategoryPage({super.key, required this.categoryList});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController controller = TextEditingController();
  List<CategoryModel> filteredCategories = [];

  @override
  void initState() {
    super.initState();
    filteredCategories = widget.categoryList;
  }

  void _searchCategories(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredCategories = widget.categoryList;
      });
    } else {
      setState(() {
        filteredCategories = widget.categoryList.where((category) {
          return category.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        margin: EdgeInsets.only(top: 63.h, left: 27.w, right: 27.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.h),
                  child: backArrow(context: context),
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: searchTextField(
                    text: "Search",
                    controller: controller,
                    onChanged: _searchCategories,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.sp),
            filteredCategories.isNotEmpty?Column(
              children: [
                reusableText(
                  text: "Shop by Categories",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 18.sp),

              ],
            ):Container(),
            Expanded(
              child: filteredCategories.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/search.png"),
                    Container(
                      alignment: Alignment.center,
                      width: 342.h,
                      height: 90.w,
                      child: Center(
                        child: reusableText(
                          text: "Sorry, we couldn't find any matching result for your search",
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center
                        ),
                      ),
                    ),
                    submitButton(text: "Explore Categories",buttonColor: AppColor.splashScreenColor,width: 185.w,
                        onTap: (){
                          Navigator.pop(context);
                    })
                  ],
                ),
              )
                  : ListView.builder(
                itemCount: filteredCategories.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 64.h,
                    margin: EdgeInsets.only(bottom: 5.h),
                    decoration: BoxDecoration(
                      color: AppColor.darkGrey,
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ItemsPage(),
                        ));
                      },
                      leading: Image.asset("assets/images/categories/${filteredCategories[index].image}"),
                      title: Text(filteredCategories[index].name),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class NoResultsPage extends StatelessWidget {
//   final String query;
//
//   NoResultsPage({required this.query});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('No Results Found'),
//       ),
//       body: Center(
//         child: Text('No categories found for "$query"'),
//       ),
//     );
//   }
// }
