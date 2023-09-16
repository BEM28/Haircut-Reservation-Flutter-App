import 'dart:ui';
import 'package:beh_hairstudio/shared_widget/button.dart';
import 'package:intl/intl.dart';
import 'package:beh_hairstudio/constant/color.dart';
import 'package:beh_hairstudio/shared_widget/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime now = DateTime.now();
  List<DateTime> daysInMonth = [];
  String selected = 'Cutting';
  String title = "Haircut", rating = "4/5", est = "20 min";
  String? selectedTime;

  void _getMonth() {
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);

    for (int i = 0; i <= endOfMonth.day - 1; i++) {
      daysInMonth.add(startOfMonth.add(Duration(days: i)));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMonth();
    String format = DateFormat('yyy-MM-dd').format(now).toString();
    selectedTime = "$format 00:00:00.000";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300.h,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'assets/images/barber.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 70.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: MyColor.primary.withOpacity(0.2),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
                          child: Row(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      title,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: MyColor.primary,
                                          fontWeight: FontWeight.w800,
                                          height: 0.6),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          rating,
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: MyColor.primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Estimation",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: MyColor.primary,
                                        fontWeight: FontWeight.w800,
                                        height: 0.6),
                                  ),
                                  Text(
                                    est,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: MyColor.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Booking Available",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: MyColor.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 75.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: daysInMonth.length,
                            itemBuilder: (context, index) {
                              var date = daysInMonth[index];
                              bool isBeforeToday = date.isBefore(
                                  DateTime(now.year, now.month, now.day));
                              bool isAfterToday = date.isAfter(
                                  DateTime(now.year, now.month, now.day));
                              bool isSameToday = date.isAtSameMomentAs(
                                  DateTime(now.year, now.month, now.day));

                              return GestureDetector(
                                onTap: isBeforeToday
                                    ? () {}
                                    : () {
                                        setState(() {
                                          selectedTime = date.toString();
                                        });
                                      },
                                child: Container(
                                  width: 80.w,
                                  margin: EdgeInsets.only(
                                      left: 2.5.w, right: 2.5.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: isBeforeToday
                                          ? MyColor.transCard
                                          : isAfterToday || isSameToday
                                              ? MyColor.accent3
                                              : null,
                                      gradient: selectedTime == date.toString()
                                          ? LinearGradient(
                                              colors: MyColor.primaryListColor,
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            )
                                          : null),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat('dd')
                                            .format(date)
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: MyColor.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        DateFormat('MMM')
                                            .format(date)
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: MyColor.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hair Service",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: MyColor.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: 10,
                      children: [
                        ServiceCard(
                          title: "Cutting",
                          assetIcon: "assets/images/cut.png",
                          selected: selected,
                          onTap: () {
                            setState(() {
                              selected = "Cutting";
                              title = "Haircut";
                              rating = "4/5";
                              est = "20 min";
                            });
                          },
                        ),
                        ServiceCard(
                          title: "Coloring",
                          assetIcon: "assets/images/paint.png",
                          selected: selected,
                          onTap: () {
                            setState(() {
                              selected = "Coloring";
                              title = "Coloring";
                              rating = "5/5";
                              est = "60 min - 120 min ";
                            });
                          },
                        ),
                        ServiceCard(
                          title: "Mixing",
                          assetIcon: "assets/images/philtre.png",
                          selected: selected,
                          onTap: () {
                            setState(() {
                              selected = "Mixing";
                              title = "Mixing";
                              rating = "4/5";
                              est = "120 min";
                            });
                          },
                        ),
                        ServiceCard(
                          title: "Restyling",
                          assetIcon: "assets/images/refresh.png",
                          selected: selected,
                          onTap: () {
                            setState(() {
                              selected = "Restyling";
                              title = "Restyling";
                              rating = "5/5";
                              est = "20 min";
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    PrimaryButton(
                      backgroundColor: MyColor.primaryListColor,
                      textColor: MyColor.primary,
                      title: "Book",
                      ontap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Row(
                            children: [
                              Icon(Icons.error, color: MyColor.primary),
                              SizedBox(width: 10.w),
                              Text(
                                'Success Booking',
                                style: TextStyle(color: MyColor.primary),
                              ),
                            ],
                          ),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
