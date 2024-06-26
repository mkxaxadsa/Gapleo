// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';

class SwitcherWidget extends StatelessWidget {
  const SwitcherWidget({
    super.key,
    required this.currentIndex,
    required this.values,
    required this.onChange,
  });
  final int currentIndex;
  final List<String> values;
  final void Function(int) onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 43,
      padding: const EdgeInsets.all(4),
      decoration: ShapeDecoration(
        color: const Color(0xFFEEE2DA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
      ),
      child: Row(
        children: List.generate(
          values.length,
          (index) {
            final isSelected = currentIndex == index;
            return GestureDetector(
              onTap: () {
                onChange(index);
              },
              child: Container(
                height: double.maxFinite,
                decoration: ShapeDecoration(
                  color: isSelected ? const Color(0xFFC67C4E) : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  values[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF242424),
                    fontSize: 16,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ).expanded();
          },
        ),
      ),
    );
  }
}
