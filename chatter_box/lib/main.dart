import 'package:chatter_box/common/routes/pages.dart';
import 'package:chatter_box/common/style/theme.dart';
import 'package:chatter_box/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chatter Box',
        theme: AppTheme.light,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    );
  }
}
