// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.height = 48,
    this.width = double.maxFinite,
    required this.centerText,
    this.leftIcon,
    required this.onTap,
  });
  final double height;
  final double width;
  final String centerText;
  final String? leftIcon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height),
          color: const Color(0xFFC67C4E),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leftIcon != null)
              Image.asset(
                leftIcon!,
                width: 24,
                color: const Color(0xFFF2F2F2),
              ).paddingOnly(right: 8),
            Text(
              centerText,
              style: const TextStyle(
                color: Color(0xFFF2F2F2),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
