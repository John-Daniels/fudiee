import 'package:fudiee/controllers/cart/cart_controller.dart';
import 'package:fudiee/screens/auth/auth_screen.dart';
import 'package:fudiee/screens/home/home_screen.dart';
import 'package:fudiee/screens/onboarding/onboarding_screen.dart';
import 'package:fudiee/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRouter {
  static List<GetPage> get routes => [
        GetPage(
          name: SplashScreen.routeName,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: OnboardingScreen.routeName,
          page: () => const OnboardingScreen(),
          transition: Transition.circularReveal,
          transitionDuration: const Duration(milliseconds: 2000),
        ),
        GetPage(
          name: AuthScreen.routeName,
          page: () => const AuthScreen(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 600),
        ),
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 600),
          binding: BindingsBuilder(() {
            Get.put(CartController());
          }),
        ),
      ];
}
