import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/features/main/components/bottom_bar.dart';
import 'package:coffee_biz/features/main/news/news_screen.dart';
import 'package:coffee_biz/features/main/settings/settings_screen.dart';
import 'package:coffee_biz/features/main/shop/shop_screen.dart';
import 'package:coffee_biz/features/main/statistics/statistics_screen.dart';
import 'package:flutter/material.dart';

String _campaign = '';
String _campaignId = '';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;

  final tabs = [
    const ShopScreen(),
    const StatisticsScreen(),
    const NewsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(child: tabs[currentTab]),
              BottomBar(
                currentTab: currentTab,
                onChange: (p0) {
                  setState(() {
                    currentTab = p0;
                  });
                },
              ).paddingOnly(left: 16, right: 16, bottom: 2),
            ],
          ),
        ),
      ),
    );
  }
}
