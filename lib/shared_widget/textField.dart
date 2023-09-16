import 'package:beh_hairstudio/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyField extends StatelessWidget {
  MyField({
    super.key,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
    this.readOnly,
    this.suffixIcon,
    this.icon,
  });

  TextEditingController? controller;
  void Function(String)? onChanged;
  bool? readOnly;
  bool? obscureText;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: 40.w,
        child: Icon(
          icon,
          color: MyColor.primary,
          size: 40.sp,
        ),
      ),
      Expanded(
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          readOnly: readOnly ?? false,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          style: TextStyle(
            fontSize: 20.sp,
            color: MyColor.primary,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    ]);
  }
}
