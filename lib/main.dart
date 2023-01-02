import 'package:flutter/material.dart';
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
    return GetMaterialApp(
      title: 'Fudiee',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildTheme(context),
      initialRoute: SplashScreen.routeName,
      getPages: AppRouter.routes,
    );
  }
}
