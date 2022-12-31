import 'package:flutter/material.dart';
import 'package:fudiee/constants/assets_constant.dart';
import 'package:fudiee/screens/auth/signin.dart';
import 'package:fudiee/screens/auth/signup.dart';
import 'package:fudiee/themes/app_colors.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static String routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: Get.height * 0.48,
                    child: Image.asset(
                      Assets.authBg,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      // padding: const EdgeInsets.fromLTRB(29, 25, 29, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(29, 25, 29, 0),
                            child: TabBar(
                              padding: EdgeInsets.zero,
                              labelPadding: EdgeInsets.zero,
                              indicatorPadding: EdgeInsets.zero,

                              // indicatorPadding: EdgeInsets.zero,
                              indicatorSize: TabBarIndicatorSize.label,
                              unselectedLabelColor: greyColor,
                              labelColor: primaryColor,
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                              indicatorColor: primaryColor,
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),

                              // indicator: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(1)),
                              tabs: const [
                                Tab(
                                  text: 'Sign in',
                                ),
                                Tab(
                                  text: 'Sign up',
                                )
                              ],
                            ),
                          ),
                          const Expanded(
                            child: TabBarView(
                              physics: BouncingScrollPhysics(),
                              children: [
                                SignIn(),
                                Signup(),
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
          ),
        ),
      ),
    );
  }
}
