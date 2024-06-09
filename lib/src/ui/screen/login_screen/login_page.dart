import 'package:fashion_finds/src/bloc/log_in_bloc/login_bloc.dart';
import 'package:fashion_finds/src/bloc/log_in_bloc/login_event.dart';
import 'package:fashion_finds/src/bloc/log_in_bloc/login_state.dart';
import 'package:fashion_finds/src/ui/common/app_colors/app_colors.dart';
import 'package:fashion_finds/src/ui/common/widgets/widgets.dart';
import 'package:fashion_finds/src/ui/screen/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../forgot_password_page/forgot_password_page.dart';
import '../register_screen/sign_up_page.dart';
import '../shopping_preference_page/shopping_preference_page.dart';


class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      //backgroundColor: AppColor.whiteColor,
      body: Container(
        margin: EdgeInsets.only(top: 123.h, left: 27.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35.h,
              child: reusableText(
                text: 'Sign in',
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 28.sp,
              ),
            ),
            SizedBox(height: 32.h),
            BlocConsumer<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myTextField(
                      context: context,
                      hintText: "Email",
                      controller: emailController,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                            TriggerOnChangedField(email: emailController.text));
                      },
                    ),
                    if (state.emailError.isNotEmpty)
                      reusableText(
                          text: state.emailError,
                          color: Colors.red,
                          fontSize: 12.sp),
                    if (state.isEmailValid)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.check_box, color: Colors.green,size: 15.sp,),
                          reusableText(
                              text: "Valid email",
                              color: Colors.green,
                              fontSize: 12.sp),
                        ],
                      ),
                    SizedBox(height: 5.h),
                    myTextField(
                      context: context,
                      obscureText: true,
                      hintText: "Password",
                      controller: passwordController,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                            TriggerPasswordOnChangedField(
                                password: passwordController.text
                            ));
                      },
                    ),
                    if (state.passwordError.isNotEmpty)
                      reusableText(
                          text: state.passwordError,
                          color: Colors.red,
                          fontSize: 12.sp),
                    if (state.isPasswordValid)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.check_box, color: Colors.green,size: 15.sp,),
                          reusableText(
                              text: "Valid password",
                              color: Colors.green,
                              fontSize: 12.sp),
                        ],
                      ),
                  ],
                );
              },
              listener: (context, state) {
                final myState = state.status;
                if (myState == LoginStatus.authenticated) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const HomePage()));
                }
              },
            ),
            SizedBox(height: 10.h),
            BlocConsumer<LoginBloc, LoginState>(

              builder: (BuildContext context, LoginState state) {
                if(state.status == LoginStatus.loading){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: reusableText(text: "Loading, please wait....")),
                      Center(child: CircularProgressIndicator())
                    ],
                  );

                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    submitButton(
                      text: "Continue",
                      buttonColor: AppColor.splashScreenColor,
                      onTap: () {
                        context.read<LoginBloc>().add(TriggerSignInButton(
                            email: emailController.text,
                            password: passwordController.text));
                      },
                    ),
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.only(left: 200.w, right: 24.w),
                      child: loginInfo(
                        context: context,
                        text: "Forgot Password?",
                        navigationText: "Reset",
                        size: 12.sp,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage()));
                        },
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Container(
                      margin: EdgeInsets.only(left: 50.w),
                      child: Center(
                        child: loginInfo(
                          context: context,
                          text: "Don't have an account?",
                          navigationText: "Sign Up",
                          size: 18.sp,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
              listener: (BuildContext context, LoginState state) {
                if(state.status == LoginStatus.authenticated){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}
