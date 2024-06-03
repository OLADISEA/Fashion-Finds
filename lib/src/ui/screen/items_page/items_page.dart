import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/top_selling_model.dart';

class ItemsPage extends StatelessWidget {
  ItemsPage({super.key});

  List<TopSellingModel> itemsList = [
    TopSellingModel(text: "Men's Fleece Pullover", price: "\$100.00", image: "women-wears.png"),
    TopSellingModel(text: "Max Cirro Men's Slides", price: "\$150.97", image: "pull-over.png"),
    TopSellingModel(text: "Men's Harrington Jacket", price: "\$110.00", image: "yellow_hoodie.png"),
    TopSellingModel(text: "Max Cirro Men's Slides", price: "\$128.97", image: "men_hoodie.png"),
    TopSellingModel(text: "Men's Harrington Jacket", price: "\$148", image: "jacket.png"),
    TopSellingModel(text: "Max Cirro Men's Slides", price: "\$50", image: "pull-over.png"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        margin: EdgeInsets.only(top: 63.h,left: 27.w,right: 27.w),
        //padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backArrow(context: context),
            SizedBox(height: 16.h,),
            reusableText(text: "Hoodies(240)"),
            SizedBox(height: 18.h,),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two containers per row
                  crossAxisSpacing: 25.0,
                  mainAxisSpacing: 28.0,
                  childAspectRatio: 0.55, // Adjust this ratio as needed
                ),
                itemCount: itemsList.length, // Replace this with the actual number of items
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColor.darkGrey
                    ),
                    child: ItemCard(
                      imagePath: 'assets/images/items/${itemsList[index].image}', // Replace with actual image paths
                      itemName: itemsList[index].text,
                      itemPrice: itemsList[index].price, // Replace with actual item prices
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

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String itemPrice;

  const ItemCard({
    Key? key,
    required this.imagePath,
    required this.itemName,
    required this.itemPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: reusableText(text: itemName,fontSize: 12.sp)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: reusableText(text: itemPrice,fontSize: 12.sp,fontWeight: FontWeight.w700)
              ),
            ],
          ),
        ),
        Positioned(
          top: 8.0,
          right: 8.0,
          child: Icon(
            Icons.favorite_border,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
