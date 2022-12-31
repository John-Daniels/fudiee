import 'package:flutter/material.dart';
import 'package:fudiee/screens/home/home_screen.dart';
import 'package:fudiee/screens/onboarding/onboarding_screen.dart';
import 'package:fudiee/themes/app_colors.dart';
import 'package:fudiee/widgets/textfield/app_textfield.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(29, 0, 29, 0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const AppTextFormField(
              hint: 'Email Address',
            ),
            const SizedBox(height: 16),
            const AppTextFormField(
              hint: 'Password',
              obscurable: true,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                  child: Checkbox(
                    splashRadius: 3,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fillColor: MaterialStatePropertyAll(primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                ),
                Text(
                  'Remember me',
                  style: TextStyle(
                    fontSize: 12,
                    color: rememberMe
                        ? primaryColor
                        : primaryTextColor.withOpacity(0.7),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 35,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            AppButton(
              text: 'Sign in',
              onPressed: () {
                Get.toNamed(HomeScreen.routeName);
              },
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dont have an account?'),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
