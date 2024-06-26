// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/core/constants/app_images.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:flutter/widgets.dart';

class TotalIncomeWidget extends StatelessWidget {
  const TotalIncomeWidget({
    super.key,
    required this.totalIncome,
  });
  final int totalIncome;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppImages.totalIncomeBg,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Income',
                    style: TextStyle(
                      color: Color(0xFFC67C4E),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      height: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ).paddingOnly(bottom: 16),
                  Text(
                    '$totalIncome\$',
                    style: const TextStyle(
                      color: Color(0xFFC67C4E),
                      fontSize: 48,
                      fontFamily: 'Roboto',
                      height: 1,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ).paddingAll(24),
            ),
          ],
        ),
      ),
    );
  }
}
