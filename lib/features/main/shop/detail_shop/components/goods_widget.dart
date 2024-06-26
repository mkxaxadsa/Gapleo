// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/app/global_navigator/global_navigator.dart';
import 'package:coffee_biz/features/main/shop/add_or_edit_goods/add_or_edit_goods_screen.dart';
import 'package:flutter/material.dart';

import 'package:coffee_biz/core/constants/app_icons.dart';
import 'package:coffee_biz/core/extensions/align_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/data/models/shop_model.dart';

class GoodsWidget extends StatelessWidget {
  const GoodsWidget({
    Key? key,
    required this.shop,
    required this.goods,
  }) : super(key: key);
  final ShopModel shop;
  final GoodsModel goods;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      decoration: ShapeDecoration(
        color: const Color(0xFFFDFDFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                goods.name,
                style: const TextStyle(
                  color: Color(0xFF3F4145),
                  fontSize: 20,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w700,
                ),
              ).expanded(),
              GestureDetector(
                onTap: () {
                  GlobalNavigator.push(
                    context,
                    page: AddOrEditGoodsScreen(
                      shop: shop,
                      goods: goods,
                    ),
                  );
                },
                child: Image.asset(
                  AppIcons.edit,
                  width: 24,
                  color: const Color(0xffC67C4E),
                ),
              ),
            ],
          ).paddingOnly(bottom: 8),
          _infoItem(
                  leftText: "Revenues of goods", rightText: "${goods.income}\$")
              .paddingOnly(bottom: 8),
          _infoItem(leftText: "Price per piece", rightText: "${goods.price}\$")
              .paddingOnly(bottom: 8),
          _infoItem(leftText: "Quantity", rightText: "${goods.quantity}")
              .paddingOnly(bottom: 8),
          Row(
            children: [
              const Text(
                'Refill every week',
                style: TextStyle(
                  color: Color(0x663F4145),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ).expanded(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: ShapeDecoration(
                  color: const Color(0xFFBDBDBD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
                child: const Text(
                  '5 days left',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _infoItem({
    required String leftText,
    required String rightText,
  }) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: ShapeDecoration(
        color: const Color(0xFFEEE2DA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        children: [
          Text(
            leftText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0x663F4145),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            rightText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ).align(Alignment.centerRight).expanded(),
        ],
      ),
    ).paddingOnly(bottom: 8);
  }
}
