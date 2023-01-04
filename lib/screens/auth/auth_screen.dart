import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiee/constants/assets_constant.dart';
import 'package:fudiee/screens/auth/signin.dart';
import 'package:fudiee/screens/auth/signup.dart';
import 'package:fudiee/themes/app_colors.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static String routeName = '/auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var currentTab = 0;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    _tabController.addListener(() {
      setState(() => currentTab = _tabController.index);
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: Get.height,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: Get.height * 0.45,
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
                      Container(
                        padding: EdgeInsets.fromLTRB(22.w, 25.h, 29.w, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _AuthTabs(
                              text: 'Sign in',
                              active: currentTab == 0,
                              onTap: () {
                                _tabController.animateTo(0);
                              },
                            ),
                            _AuthTabs(
                              text: 'Sign up',
                              active: currentTab == 1,
                              onTap: () {
                                _tabController.animateTo(1);
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          physics: const BouncingScrollPhysics(),
                          children: const [
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
    );
  }
}

class _AuthTabs extends StatelessWidget {
  const _AuthTabs({
    Key? key,
    required this.text,
    required this.active,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        padding: const EdgeInsets.all(8),
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: active ? primaryTextColor : greyColor,
                    ),
              ),
              const SizedBox(height: 2),
              AnimatedOpacity(
                opacity: active ? 1 : 0,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  width: 42,
                  height: 3,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
