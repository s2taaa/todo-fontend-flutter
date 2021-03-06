import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo/themes/theme.dart';
import 'package:todo/welcome/welcome_controller.dart';
import 'package:todo/widgets/widgets.dart';

//Welcome screen
class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Hi! Todo app',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                Image.asset(
                  'assets/icons/logo.png',
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                ),
                SizedBox(height: size.height * 0.1),
                //Sign in button
                RoundedButton(
                  buttonText: 'signin'.tr,
                  colors: const [AppColors.primary, AppColors.secondary],
                  color: Colors.blue.shade300,
                  width: size.width * 0.8,
                  onPressed: () => Get.toNamed('/login'),
                ),
                //Sign up button
                RoundedButton(
                  buttonText: 'signup'.tr,
                  width: size.width * 0.8,
                  colors: const [AppColors.light, AppColors.hintLight],
                  color: AppColors.light,
                  textColor: AppColors.dark,
                  onPressed: () => Get.toNamed('/auth'),
                ),
                //Choose language button
                TextButton(
                  onPressed: () {
                    controller.buildLanguageDialog(context);
                  },
                  child: Text(
                    'changelang'.tr,
                    style: const TextStyle(
                        color: AppColors.light,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
