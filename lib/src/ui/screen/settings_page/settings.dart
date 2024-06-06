import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/settings_page/component/settings_card.dart';
import 'package:fashion_finds/src/ui/screen/settings_page/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //switch
            //CupertinoSwitch(
                //value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode, onChanged: (value){
              //Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
            //}),
            Center(
              child: CircleAvatar(
                radius: 30.r,
                child: Image.asset("assets/images/user-image.png",width: 80.w,height: 80.h,),
              ),
            ),
            userInfo(),
            SettingsCard(text: "Address"),
            SettingsCard(text: "Wishlist"),
            SettingsCard(text: "Payment"),
            SettingsCard(text: "Help"),
            SettingsCard(text: "Support"),
            
            myTextButton(text: "Sign Out", onTap: (){},color: Colors.red)

          ],
        ),
      ),
    );
  }
}
