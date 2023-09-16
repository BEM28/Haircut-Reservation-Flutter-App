import 'package:beh_hairstudio/constant/color.dart';
import 'package:beh_hairstudio/shared_widget/button.dart';
import 'package:beh_hairstudio/shared_widget/textField.dart';
import 'package:beh_hairstudio/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColor.backgroundColor,
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/backgroundLogin.png',
            fit: BoxFit.contain,
          ),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                margin: EdgeInsets.only(left: 30.w, right: 30.w),
                width: double.infinity,
                height: 380.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: MyColor.transCard,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 30.sp,
                          color: MyColor.primary,
                          fontWeight: FontWeight.w800,
                          height: 0.8.sp),
                    ),
                    MyField(
                      icon: Icons.person,
                    ),
                    MyField(
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(height: 10.h),
                    PrimaryButton(
                      backgroundColor: MyColor.primaryListColor,
                      textColor: MyColor.primary,
                      title: "Login",
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ]),
      ]),
    );
  }
}
