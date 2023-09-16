import 'package:beh_hairstudio/constant/color.dart';
import 'package:beh_hairstudio/shared_widget/button.dart';
import 'package:beh_hairstudio/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColor.backgroundColor,
        body: Stack(children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/backgroundSplash.png',
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Beh",
                  style: TextStyle(
                      fontSize: 50.sp,
                      color: MyColor.primary,
                      fontWeight: FontWeight.w800,
                      height: 0.8.sp),
                ),
                Text(
                  "Haircut Studio",
                  style: TextStyle(
                      fontSize: 50.sp,
                      color: MyColor.primary,
                      fontWeight: FontWeight.w800,
                      height: 1.sp),
                ),
                Text(
                  "Booking Apps",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: MyColor.primary,
                  ),
                ),
                SizedBox(height: 70.h),
                PrimaryButton(
                  backgroundColor: MyColor.primaryListColor,
                  textColor: MyColor.primary,
                  title: "Get Started",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          )
        ]));
  }
}
