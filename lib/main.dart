import 'package:beh_hairstudio/constant/color.dart';
import 'package:beh_hairstudio/view/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FinApp',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: MyColor.secondary, // Ubah ke warna yang diinginkan
            ),
            fontFamily: 'Quiksand',
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
