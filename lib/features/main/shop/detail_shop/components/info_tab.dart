// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/core/extensions/align_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:flutter/material.dart';

import 'package:coffee_biz/data/models/shop_model.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({
    super.key,
    required this.shop,
  });
  final ShopModel shop;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          decoration: ShapeDecoration(
            color: const Color(0xFFEEE2DA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
          ),
          child: Row(
            children: [
              const Text(
                'Income',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0x663F4145),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${shop.totalIncome}\$',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ).align(Alignment.centerRight).expanded(),
            ],
          ),
        ).paddingOnly(bottom: 8),
        Container(
          decoration: ShapeDecoration(
            color: const Color(0xFFEEE2DA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          width: double.maxFinite,
          padding: const EdgeInsets.all(16),
          child: Text(
            shop.description,
            style: const TextStyle(
              color: Color(0xFF3F4145),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ).paddingSymetric(horizontal: 16);
  }
}
