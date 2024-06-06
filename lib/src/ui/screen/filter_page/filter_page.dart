import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/top_selling_model.dart';
import '../../common/app_colors/app_colors.dart';
import '../../common/widgets/widgets.dart';
import '../items_page/items_page.dart';


class FilterPage extends StatelessWidget {
  final List<TopSellingModel> filteredItems;

  FilterPage({super.key, required this.filteredItems});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        reusableText(text: "52 results found"),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two containers per row
              crossAxisSpacing: 25.0,
              mainAxisSpacing: 28.0,
              childAspectRatio: 0.55, // Adjust this ratio as needed
            ),
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              return Container(
                height: 64.h,
                margin: EdgeInsets.only(bottom: 5.h),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                ),
                child: ItemCard(
                  imagePath: "assets/images/items/${filteredItems[index].image}",
                 // leading: Image.asset("assets/images/items/${filteredItems[index].image}"),
                  itemName: filteredItems[index].text,
                  itemPrice: filteredItems[index].price,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class EmptyCategory extends StatelessWidget {
  const EmptyCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
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
      ),
    );
  }
}

