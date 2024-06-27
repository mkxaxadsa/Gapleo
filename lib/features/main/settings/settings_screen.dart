import 'package:coffee_biz/core/constants/app_icons.dart';
import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/features/main/statistics/components/diagram_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationsTurned = true;
  bool share = true;
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
          'Settings',
          style: TextStyle(
            color: Color(0xFF3F4145),
            fontSize: 32,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ).paddingOnly(bottom: 16),
        GestureDetector(
          onTap: () {
            InAppReview.instance.openStoreListing(appStoreId: '6504753447');
          },
          child: Container(
            width: double.maxFinite,
            height: 56,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(width: 1, color: Color(0xFFC67C4E)),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.star, color: Color(0xCCC67C4E)),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Rate app',
                  style: const TextStyle(
                    color: Color(0xCCC67C4E),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ).expanded(),
                Image.asset(
                  AppIcons.chevronRight,
                  width: 24,
                ),
              ],
            ),
          ),
        ).paddingOnly(bottom: 8),
        _item(
          icon: AppIcons.terms,
          text: "Terms of use",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPx(
                    data:
                        'https://docs.google.com/document/d/1q6gGb5P5j3JdBSypkfg1Sk63vgFCWeXzCvHWS-ft-mE/edit?usp=sharing'),
              ),
            );
          },
        ).paddingOnly(bottom: 8),
        _item(
          icon: AppIcons.privacy,
          text: "Privacy Policy",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPx(
                    data:
                        'https://docs.google.com/document/d/14wnTrHCuHJHmlq7ycYk3FRLbFySq1mk9XD4zj-kfW1c/edit?usp=sharing'),
              ),
            );
          },
        ).paddingOnly(bottom: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPx(
                    data: 'https://forms.gle/Ht7dFyYQszcvryHB8'),
              ),
            );
          },
          child: Container(
            width: double.maxFinite,
            height: 56,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(width: 1, color: Color(0xFFC67C4E)),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.support_agent, color: Color(0xCCC67C4E)),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Need Help?',
                  style: const TextStyle(
                    color: Color(0xCCC67C4E),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ).expanded(),
                Image.asset(
                  AppIcons.chevronRight,
                  width: 24,
                ),
              ],
            ),
          ),
        ).paddingOnly(bottom: 8),
        Builder(builder: (ctx) {
          return GestureDetector(
            onTap: () {
              if (share) {
                share = false;
                final box = ctx.findRenderObject() as RenderBox?;
                Share.shareWithResult('Check out Gapleo! Download in AppStore!',
                        sharePositionOrigin:
                            box!.localToGlobal(Offset.zero) & box.size)
                    .whenComplete(
                  () => share = true,
                );
              }
            },
            child: Container(
              width: double.maxFinite,
              height: 56,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xFFC67C4E)),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.share, color: Color(0xCCC67C4E)),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Share app',
                    style: const TextStyle(
                      color: Color(0xCCC67C4E),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ).expanded(),
                  Image.asset(
                    AppIcons.chevronRight,
                    width: 24,
                  ),
                ],
              ),
            ),
          ).paddingOnly(bottom: 8);
        }),
        _item(
          icon: AppIcons.notification,
          text: "Send notification",
          onTap: () {},
          rightWidget: Switch(
            value: isNotificationsTurned,
            onChanged: (value) {
              isNotificationsTurned = value;
              setState(() {});
            },
            activeColor: const Color(0xFFC67C4E),
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.white,
            inactiveThumbColor: Colors.grey,
          ),
        ).paddingOnly(bottom: 8),
      ],
    );
  }

  Widget _item({
    required String icon,
    required String text,
    required VoidCallback onTap,
    Widget? rightWidget,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 56,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFC67C4E)),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 24,
            ).paddingOnly(right: 8),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xCCC67C4E),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ).expanded(),
            rightWidget ??
                Image.asset(
                  AppIcons.chevronRight,
                  width: 24,
                ),
          ],
        ),
      ),
    );
  }
}
