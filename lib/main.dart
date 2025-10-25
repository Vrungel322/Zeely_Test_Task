import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeely_test_task/features/di/feature_di.dart';
import 'package:zeely_test_task/screens/screen_avatars/screen_avatars.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  DiInitializer.initDi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: false,
      child: const AvatarsPage(),
      builder: (c, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(useMaterial3: false),
          initialRoute: '/',
          getPages: [GetPage(name: '/', page: () => child ?? const SizedBox(), binding: ZlBinding())],
        );
      },
    );
  }
}
