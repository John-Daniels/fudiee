import 'package:flutter/material.dart';
import 'package:fudiee/screens/onboarding/onboarding_screen.dart';
import 'package:fudiee/themes/app_colors.dart';
import 'package:fudiee/widgets/textfield/app_textfield.dart';

class Signup extends StatefulWidget {
  const Signup({
    Key? key,
  }) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(29, 0, 29, 0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            const AppTextFormField(hint: 'Email Address'),
            const SizedBox(height: 10),
            const AppTextFormField(hint: 'Password', obscurable: true),
            const SizedBox(height: 10),
            const AppTextFormField(hint: 'Confirm Password', obscurable: true),
            const SizedBox(height: 18),
            AppButton(
              text: 'Sign up',
              onPressed: () {},
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
                    'Sign in',
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
