// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/app/global_navigator/global_navigator.dart';
import 'package:coffee_biz/core/extensions/align_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/core/ui/application_bar.dart';
import 'package:coffee_biz/core/ui/switcher_widget.dart';
import 'package:coffee_biz/features/main/shop/add_or_edit_shop/add_or_edit_shop_screen.dart';
import 'package:coffee_biz/features/main/shop/detail_shop/components/goods_tab.dart';
import 'package:coffee_biz/features/main/shop/detail_shop/components/info_tab.dart';
import 'package:flutter/material.dart';

import 'package:coffee_biz/data/models/shop_model.dart';

class DetailShopScreen extends StatefulWidget {
  const DetailShopScreen({
    super.key,
    required this.shop,
  });
  final ShopModel shop;
  @override
  State<DetailShopScreen> createState() => _DetailShopScreenState();
}

class _DetailShopScreenState extends State<DetailShopScreen> {
  int currentTab = 0;

  late final List<Map<String, dynamic>> tabs;

  @override
  void initState() {
    tabs = [
      {
        "label": "Info",
        "tab": InfoTab(
          shop: widget.shop,
        ),
      },
      {
        "label": "Goods",
        "tab": GoodsTab(
          shop: widget.shop,
        ),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              ApplicationBar(
                centerText: "Coffee shop",
                centerSecondaryText: widget.shop.title,
                onBack: () {
                  Navigator.pop(context);
                },
                rightWidget: GestureDetector(
                  onTap: () {
                    GlobalNavigator.push(
                      context,
                      page: AddOrEditShopScreen(
                        shop: widget.shop,
                      ),
                    );
                  },
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      color: Color(0xFF3F4145),
                      fontSize: 16,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w500,
                    ),
                  ).paddingSymetric(horizontal: 8),
                ),
              ).paddingSymetric(horizontal: 8),
              SwitcherWidget(
                currentIndex: currentTab,
                values: tabs
                    .map(
                      (e) => e["label"] as String,
                    )
                    .toList(),
                onChange: (p0) {
                  setState(() {
                    currentTab = p0;
                  });
                },
              ).paddingSymetric(horizontal: 31.5).paddingOnly(bottom: 16),
              (tabs[currentTab]["tab"] as Widget).expanded(),
            ],
          ),
        ),
      ),
    );
  }
}
