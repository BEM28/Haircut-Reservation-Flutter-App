import 'package:beh_hairstudio/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCard extends StatelessWidget {
  ServiceCard(
      {super.key,
      required this.title,
      this.assetIcon,
      this.onTap,
      this.selected});

  final String title;
  String? assetIcon;
  String? selected;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 50.h,
        margin: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: selected == title ? null : MyColor.accent3,
          gradient: selected == title
              ? LinearGradient(
                  colors: MyColor.primaryListColor,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.all(3.w),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            color: MyColor.accent3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 10.w),
              selected == title
                  ? ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: MyColor.primaryListColor,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      child: Image.asset(
                        assetIcon!,
                        width: 30.w,
                        color: MyColor.primary,
                      ))
                  : Image.asset(
                      assetIcon!,
                      width: 30.w,
                      color: MyColor.primary,
                    ),
              selected == title
                  ? ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: MyColor.primaryListColor,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: MyColor.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              SizedBox(width: 10.w),
            ],
          ),
        ),
      ),
    );
  }
}
