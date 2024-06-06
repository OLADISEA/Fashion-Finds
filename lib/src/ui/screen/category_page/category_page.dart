import 'package:fashion_finds/src/models/category_model.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/items_page/items_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/top_selling_model.dart';
import '../../common/app_colors/app_colors.dart';
import '../fashion_page/widget/widget.dart';
import '../filter_page/filter_page.dart';

class CategoryPage extends StatefulWidget {
  final List<CategoryModel> categoryList;
  CategoryPage({super.key, required this.categoryList});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController controller = TextEditingController();
  List<CategoryModel> filteredCategories = [];
  List<TopSellingModel> itemsList = [
    TopSellingModel(text: "Men's Fleece Pullover", price: "\$100.00", image: "women-wears.png"),
    TopSellingModel(text: "Max Cirro Men's Slides", price: "\$150.97", image: "pull-over.png"),
    TopSellingModel(text: "Men's Harrington Jacket", price: "\$110.00", image: "yellow_hoodie.png"),
    TopSellingModel(text: "Max Cirro Men's Slides", price: "\$128.97", image: "men_hoodie.png"),
    TopSellingModel(text: "Men's Harrington Jacket", price: "\$148", image: "jacket.png"),
    TopSellingModel(text: "Max Cirro Men's Slides", price: "\$50", image: "pull-over.png"),
  ];
  List<TopSellingModel> myFilter = [];

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
        myFilter = itemsList.where((items) {
          return items.text.toLowerCase().contains(query.toLowerCase());
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
            controller.text.isEmpty
                ? Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText(
                    text: "Shop by Categories",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 18.sp),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 64.h,
                          margin: EdgeInsets.only(bottom: 5.h),
                          decoration: const BoxDecoration(
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
            )
                : myFilter.isEmpty
                ? Expanded(child: EmptyCategory())
                : Expanded(child: FilterPage(filteredItems: myFilter)),
          ],
        ),
      ),
    );
  }
}