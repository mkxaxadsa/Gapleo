// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:flutter/material.dart';

import 'package:coffee_biz/core/models/statistic_model.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SettingsPx extends StatelessWidget {
  final String data;

  const SettingsPx({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(data)),
      ),
    );
  }
}

class DiagramWidget extends StatelessWidget {
  const DiagramWidget({
    super.key,
    required this.statistics,
    required this.max,
  });
  final List<StatisticModel> statistics;
  final int max;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 210,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          statistics.length,
          (index) {
            final stat = statistics[index];
            return Column(
              children: [
                Column(
                  children: [
                    if (max - stat.value > 0)
                      Spacer(
                        flex: max - stat.value,
                      ),
                    if (stat.value == 0)
                      Container(
                        width: 30,
                        height: 8,
                        decoration: ShapeDecoration(
                          color: const Color(0x0F3F4145),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      )
                    else
                      Container(
                        width: 30,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFC67C4E),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ).expanded(flex: min(stat.value, max)),
                  ],
                ).expanded(),
                Text(
                  stat.label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingOnly(top: 8),
              ],
            );
          },
        ),
      ),
    );
  }
}
