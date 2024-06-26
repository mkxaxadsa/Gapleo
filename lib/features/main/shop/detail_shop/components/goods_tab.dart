// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/app/global_navigator/global_navigator.dart';
import 'package:coffee_biz/core/constants/app_icons.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/core/ui/app_button.dart';
import 'package:coffee_biz/features/main/shop/add_or_edit_goods/add_or_edit_goods_screen.dart';
import 'package:coffee_biz/features/main/shop/detail_shop/components/goods_widget.dart';
import 'package:flutter/material.dart';

import 'package:coffee_biz/data/models/shop_model.dart';

class GoodsTab extends StatelessWidget {
  const GoodsTab({
    super.key,
    required this.shop,
  });
  final ShopModel shop;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        ...List.generate(
          shop.products.length,
          (index) {
            return GoodsWidget(
              goods: shop.products[index],
              shop: shop,
            ).paddingOnly(bottom: 8);
          },
        ),
        AppButton(
          centerText: "Add Goods",
          leftIcon: AppIcons.addCircle,
          onTap: () {
            GlobalNavigator.push(
              context,
              page: AddOrEditGoodsScreen(
                shop: shop,
              ),
            );
          },
        ).paddingOnly(top: 60, bottom: 8),
        AppButton(
          centerText: "Refill goods & Collect money",
          onTap: () {},
        ).paddingOnly(bottom: 16)
      ],
    );
  }
}
