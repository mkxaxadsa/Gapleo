// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/app/global_navigator/global_navigator.dart';
import 'package:coffee_biz/core/constants/app_icons.dart';
import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/data/helpers/hive_helper.dart';
import 'package:coffee_biz/data/models/shop_model.dart';
import 'package:coffee_biz/features/main/shop/detail_shop/detail_shop_screen.dart';
import 'package:flutter/material.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({
    super.key,
    required this.shop,
    required this.onUpdate,
  });
  final ShopModel shop;
  final VoidCallback onUpdate;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GlobalNavigator.push(context, page: DetailShopScreen(shop: shop));
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  shop.title,
                  style: const TextStyle(
                    color: Color(0xFF3F4145),
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ).expanded(),
                Container(
                  width: 100,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEEE2DA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${shop.totalIncome}\$',
                        style: const TextStyle(
                          color: Color(0xFFC67C4E),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Income',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0x663F4145),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ).paddingOnly(bottom: 10),
            Text(
              shop.description,
              style: const TextStyle(
                color: Color(0x663F4145),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ).paddingOnly(bottom: 10),
            if (shop.products.isNotEmpty)
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: const Color(0xFFEEE2DA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Goods',
                      style: TextStyle(
                        color: Color(0xFFC67C4E),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ).paddingOnly(bottom: 8),
                    Wrap(
                      runSpacing: 4,
                      spacing: 4,
                      children: List.generate(
                        shop.products.length,
                        (index) {
                          final item = shop.products[index];
                          return Container(
                            height: 26,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFC67C4E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    List<GoodsModel> goods =
                                        List<GoodsModel>.from(shop.products);
                                    goods.removeAt(index);
                                    final newShop =
                                        shop.copyWith(products: goods);
                                    HiveHelper.editShop(newShop).then(
                                      (value) {
                                        onUpdate();
                                      },
                                    );
                                  },
                                  child: Image.asset(
                                    AppIcons.close,
                                    width: 12,
                                    color: Colors.white,
                                  ),
                                ).paddingOnly(right: 4),
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
