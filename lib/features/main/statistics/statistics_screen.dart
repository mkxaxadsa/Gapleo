import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/core/models/statistic_model.dart';
import 'package:coffee_biz/core/ui/switcher_widget.dart';
import 'package:coffee_biz/data/helpers/hive_helper.dart';
import 'package:coffee_biz/data/models/shop_model.dart';
import 'package:coffee_biz/features/main/statistics/components/diagram_widget.dart';
import 'package:flutter/material.dart';

const _max = 25; // change

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final todayStatistics = [
    StatisticModel(
      value: 25,
      label: "Mon",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Tue",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Wed",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Thu",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Fri",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Sat",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Sun",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
  ];

  final weekStatistics = [
    StatisticModel(
      value: 25,
      label: "Mon",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Tue",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Wed",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Thu",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Fri",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Sat",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "Sun",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
  ];

  final monthStatistics = [
    StatisticModel(
      value: 25,
      label: "W 1",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "W 2",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "W 3",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
    StatisticModel(
      value: 0,
      label: "W 4",
      dateTime: DateTime.now(),
    ), // change Date to Real Dates
  ];

  final shops = HiveHelper.shops;
  ShopModel? currentShop;
  int currentRangeIndex = 0; //

  @override
  void initState() {
    if (shops.isNotEmpty) {
      currentShop = shops.first;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        bottom: 100,
        left: 16,
        right: 16,
        top: 44,
      ),
      children: [
        const Text(
          'Statistics',
          style: TextStyle(
            color: Color(0xFF3F4145),
            fontSize: 32,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
        if (currentShop != null) ...[
          DropdownButton(
            elevation: 0,
            isExpanded: false,
            underline: const SizedBox(),
            value: currentShop!.title,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: shops.map((ShopModel item) {
              return DropdownMenuItem(
                value: item.title,
                child: Text(item.title),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                final filter = shops.where(
                  (element) => element.title == newValue,
                );
                if (filter.isNotEmpty) {
                  currentShop = filter.first;
                }
              });
            },
          ).paddingOnly(bottom: 12),
          SwitcherWidget(
            currentIndex: currentRangeIndex,
            values: const ["Today", "Week", "Month"],
            onChange: (p0) {
              setState(() {
                currentRangeIndex = p0;
              });
            },
          ).paddingOnly(bottom: 24),
          DiagramWidget(
            statistics: currentRangeIndex == 0
                ? todayStatistics
                : currentRangeIndex == 1
                    ? weekStatistics
                    : monthStatistics,
            max: _max,
          ).paddingOnly(bottom: 16),
          _infoItem(leftText: "Amount Balance", rightText: "0\$").paddingOnly(bottom: 8),
          _infoItem(leftText: "Income", rightText: "${currentShop!.totalIncome}\$").paddingOnly(bottom: 8),
          _infoItem(leftText: "Expenses", rightText: "0\$").paddingOnly(bottom: 30),
        ]
      ],
    );
  }

  Widget _infoItem({
    required String leftText,
    required String rightText,
  }) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        color: const Color(0xFFEEE2DA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
      ),
      child: Row(
        children: [
          Text(
            leftText,
            style: const TextStyle(
              color: Color(0x663F4145),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ).expanded(),
          Text(
            rightText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0.09,
            ),
          )
        ],
      ),
    );
  }
}
