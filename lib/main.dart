import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiee/routes/router.dart';
import 'package:fudiee/screens/splash/splash_screen.dart';
import 'package:fudiee/themes/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return GetMaterialApp(
          title: 'Fudiee',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.buildTheme(context),
          initialRoute: SplashScreen.routeName,
          getPages: AppRouter.routes,
        );
      },
    );
  }
}
