import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudiee/themes/app_colors.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    // await SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: [],
    // );

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: scaffoldBgColor, // navigation bar color
        statusBarColor: Colors.transparent,
      ),
    );
  }
}
