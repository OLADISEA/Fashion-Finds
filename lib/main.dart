import 'package:fashion_finds/src/bloc/log_in_bloc/login_bloc.dart';
import 'package:fashion_finds/src/bloc/theme_bloc/theme_bloc.dart';
import 'package:fashion_finds/src/bloc/theme_bloc/theme_mode.dart';
import 'package:fashion_finds/src/bloc/theme_bloc/theme_state.dart';
import 'package:fashion_finds/src/ui/common/theme/theme_constants.dart';
import 'package:fashion_finds/src/ui/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider(create: (context) => LoginBloc())
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          ThemeData themeData = themeState.status == AppThemeMode.light
              ? ThemeConstants.lightMode
              : ThemeConstants.darkMode;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
