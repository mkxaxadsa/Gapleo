import 'package:coffee_biz/app/global_navigator/global_navigator.dart';
import 'package:coffee_biz/core/constants/app_icons.dart';
import 'package:coffee_biz/core/constants/app_images.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/core/ui/app_button.dart';
import 'package:coffee_biz/data/helpers/hive_helper.dart';
import 'package:coffee_biz/features/main/shop/add_or_edit_shop/add_or_edit_shop_screen.dart';
import 'package:coffee_biz/features/main/shop/components/shop_item.dart';
import 'package:coffee_biz/features/main/shop/components/total_income_widget.dart';
import 'package:flutter/widgets.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    final shops = HiveHelper.shops;
    final totalIncome = shops.isEmpty
        ? 0
        : shops
            .map(
              (e) => e.totalIncome,
            )
            .toList()
            .reduce(
              (value, element) => value + element,
            );
    return ListView(
      padding: const EdgeInsets.only(
        bottom: 100,
        left: 16,
        right: 16,
        top: 32,
      ),
      children: [
        TotalIncomeWidget(totalIncome: totalIncome).paddingOnly(bottom: 24),
        const Text(
          'Your Coffee shop',
          style: TextStyle(
            color: Color(0xFF3F4145),
            fontSize: 24,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ).paddingOnly(bottom: 8),
        if (shops.isEmpty)
          SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.noShop,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ).paddingSymetric(horizontal: 34).paddingOnly(top: 32),
                const Text(
                  'You do not have a coffee shop added, to add a coffee shop tap Add Coffee shop button.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x663F4145),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingOnly(top: 24),
              ],
            ),
          )
        else
          ...List.generate(
            shops.length,
            (index) {
              return ShopItem(
                onUpdate: () {
                  setState(() {});
                },
                shop: shops[index],
              ).paddingOnly(bottom: 8);
            },
          ),
        AppButton(
          centerText: "Add Cafe",
          leftIcon: AppIcons.addCircle,
          onTap: () {
            GlobalNavigator.push(context, page: const AddOrEditShopScreen());
          },
        ).paddingSymetric(vertical: 14),
      ],
    );
  }
}
