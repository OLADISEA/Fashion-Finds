import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_finds/src/models/top_selling_model.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/category_page/category_page.dart';
import 'package:fashion_finds/src/ui/screen/fashion_page/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/category_model.dart';
import '../../common/app_colors/app_colors.dart';

class FashionPage extends StatefulWidget {
  FashionPage({Key? key}) : super(key: key);

  @override
  State<FashionPage> createState() => _FashionPageState();
}

class _FashionPageState extends State<FashionPage> {
  final TextEditingController controller = TextEditingController();

  List<CategoryModel> categoriesList = [
    CategoryModel(name: "Hoodies", image: "hoodies.png"),
    CategoryModel(name: "Shorts", image: "shorts.png"),
    CategoryModel(name: "Shoes", image: "shoes.png"),
    CategoryModel(name: "Bag", image: "bag.png"),
    CategoryModel(name: "Accessories", image: "accessories.png"),
  ];

  List<TopSellingModel> topSellingList = [
    TopSellingModel(text: "Men's Harrington Jacket", price: "\$148", image: "jacket.png"),
    TopSellingModel(text: "Max Cirro Men's Slides", price: "\$50", image: "slides.png"),
    TopSellingModel(text: "Men's Harrington Jacket", price: "\$148", image: "jacket.png"),
    TopSellingModel(text: "Max Cirro Men's Slides", price: "\$50", image: "slides.png"),
    TopSellingModel(text: "Men's Harrington Jacket", price: "\$148", image: "jacket.png"),
    TopSellingModel(text: "Max Cirro Men's Slides", price: "\$50", image: "slides.png"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 63.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              homeHeader(),
              searchTextField(text: "Search", controller: controller),
              SizedBox(height: 24.h),
              categories(title: "Categories", title2: "See All",onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> CategoryPage(categoryList: categoriesList)));
              }),
              SizedBox(height: 15.h,),

              Container(
                height: 80.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      //width: 76.w,
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundImage: AssetImage("assets/images/categories/${categoriesList[index].image}",),
                            //child: Image.asset("assets/images/categories/${categoriesList[index].image}"),
                          ),
                          reusableText(text: categoriesList[index].name,fontSize: 12.sp),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15.h,),
              categories(title: "Top Selling", title2: "See All",onTap: (){}),


              CarouselSlider.builder(
                itemCount: topSellingList.length,
                itemBuilder: (context, index, realIndex) {
                  final TopSellingModel sellingItem = topSellingList[index];
                  return topSellingItems(
                    sellingItem: sellingItem,
                    onTap: () {
                      setState(() {
                        sellingItem.isFav = !sellingItem.isFav;
                      });
                    },
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1.4,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.4,
                ),
              ),
              SizedBox(height: 15.h,),
              categories(title: "New In", title2: "See All",onTap: (){}),
              SizedBox(height: 10.h,),
              CarouselSlider.builder(
                itemCount: topSellingList.length,
                itemBuilder: (context, index, realIndex) {
                  final TopSellingModel sellingItem = topSellingList[index];
                  return topSellingItems(
                    sellingItem: sellingItem,
                    onTap: () {
                      setState(() {
                        sellingItem.isFav = !sellingItem.isFav;
                      });
                    },
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1.4,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
