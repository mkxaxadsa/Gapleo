// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/core/constants/app_icons.dart';
import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/opacity_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.currentTab,
    required this.onChange,
  });
  final int currentTab;
  final void Function(int) onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 65,
      decoration: ShapeDecoration(
        color: const Color(0xFFEEE2DA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          _item(icon: AppIcons.coffee, label: "Shop", index: 0),
          _item(icon: AppIcons.statistics, label: "Statistics", index: 1),
          _item(icon: AppIcons.news, label: "News", index: 2),
          _item(icon: AppIcons.settings, label: "Settings", index: 3),
        ],
      ),
    );
  }

  Widget _item({
    required String icon,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        onChange(index);
      },
      child: Container(
        height: double.maxFinite,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 24,
              color: const Color(0xFFC67C4E),
            ).paddingOnly(bottom: 8),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFFC67C4E),
                fontSize: 10,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    ).opacity(index == currentTab ? 1 : .7).expanded();
  }
}
