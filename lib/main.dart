import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiee/bindings/bindings.dart';
import 'package:fudiee/routes/router.dart';
import 'package:fudiee/screens/splash/splash_screen.dart';
import 'package:fudiee/themes/theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    OrientationBuilder(
      builder: (context, orientation) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return GetMaterialApp(
          initialBinding: InitialBindings(),
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
