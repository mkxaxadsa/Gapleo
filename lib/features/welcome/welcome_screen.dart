import 'package:coffee_biz/app/global_navigator/global_navigator.dart';
import 'package:coffee_biz/core/constants/app_images.dart';
import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/core/ui/app_button.dart';
import 'package:coffee_biz/features/main/main_screen.dart';
import 'package:coffee_biz/data/helpers/hive_helper.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Image.asset(
                  AppImages.welcomeBg,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ).expanded(flex: 2),
                const Spacer(),
              ],
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  const Text(
                    'Welcome to\nGapleo: Coffee App!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ).paddingOnly(bottom: 8),
                  const Text(
                    'Explore the best business practices in the coffee industry and move towards success with us. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ).paddingOnly(bottom: 32),
                  AppButton(
                    centerText: "Get started",
                    onTap: () {
                      HiveHelper.setIsNotFirstTimeOpen();
                      GlobalNavigator.pushAndRemoveUntil(context,
                          page: const MainScreen());
                    },
                  ).paddingOnly(bottom: 32),
                  const Text(
                    'Terms of Use / Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFE0E0E0),
                      fontSize: 9,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ).paddingOnly(bottom: 16),
                ],
              ).paddingSymetric(horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}
