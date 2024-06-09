import 'package:fashion_finds/src/bloc/theme_bloc/theme_bloc.dart';
import 'package:fashion_finds/src/bloc/theme_bloc/theme_mode.dart';
import 'package:fashion_finds/src/bloc/theme_bloc/theme_state.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/login_screen/login_page.dart';
import 'package:fashion_finds/src/ui/screen/settings_page/component/settings_card.dart';
import 'package:fashion_finds/src/ui/screen/settings_page/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/theme_bloc/theme_event.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        margin: EdgeInsets.only(top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //switch
            BlocBuilder<ThemeBloc,ThemeState>(
              builder: (BuildContext context, state) {
                return CupertinoSwitch(
                  value: state.status == AppThemeMode.dark,
                  onChanged: (value){
                    context.read<ThemeBloc>().add(ToggleThemeEvent());

                  },
                  //value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode, onChanged: (value){
                  //Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                  //}
                );
              },
            ),
            Center(
              child: CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage("assets/images/user-image.png"),
              ),
            ),
            userInfo(context),
            SettingsCard(text: "Address"),
            SettingsCard(text: "Wishlist"),
            SettingsCard(text: "Payment"),
            SettingsCard(text: "Help"),
            SettingsCard(text: "Support"),
            
            myTextButton(text: "Sign Out", onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage()));
            },color: Colors.red)

          ],
        ),
      ),
    );
  }
}
