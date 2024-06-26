// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/core/constants/app_icons.dart';
import 'package:coffee_biz/core/extensions/align_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:flutter/material.dart';

class ApplicationBar extends StatelessWidget {
  const ApplicationBar({
    super.key,
    required this.centerText,
    this.onBack,
    this.centerSecondaryText,
    this.rightWidget,
  });
  final String centerText;
  final String? centerSecondaryText;
  final VoidCallback? onBack;
  final Widget? rightWidget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 44,
      child: Row(
        children: [
          if (onBack != null)
            GestureDetector(
              onTap: onBack,
              child: Container(
                color: Colors.transparent,
                height: 35,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppIcons.back,
                      width: 24,
                    ).paddingOnly(right: 3),
                    const Text(
                      'Back',
                      style: TextStyle(
                        color: Color(0xFF3F4145),
                        fontSize: 16,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                centerText,
                style: const TextStyle(
                  color: Color(0xFF3F4145),
                  fontSize: 16,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              if (centerSecondaryText != null)
                Text(
                  centerSecondaryText!,
                  style: const TextStyle(
                    color: Color(0x663F4145),
                    fontSize: 14,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
            ],
          ).align().expanded(),
          if (rightWidget != null) rightWidget!else if(onBack != null) const SizedBox(width: 65,)
        ],
      ),
    );
  }
}
