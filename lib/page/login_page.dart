import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hi_bank/constant/colors.dart';
import 'package:test_hi_bank/constant/typography.dart';
import 'package:test_hi_bank/controller/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Page',
              style: TStyle.title.copyWith(fontSize: 20),
            ),
            MaterialButton(
              onPressed: () {
                Get.dialog(
                  const Center(
                    child: CircularProgressIndicator(
                      color: kColorOrange,
                    ),
                  ),
                );
                AuthController.instance.signInWithGoogle();
              },
              color: kColorOrangeTab,
              child: Text(
                'Sign in with Google',
                style: TStyle.title.copyWith(color: kColorWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
