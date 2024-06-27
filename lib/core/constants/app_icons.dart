import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:coffee_biz/core/data/news_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AppIcons {
  static const _prefix = "assets/icons/";
  static const addCircle = "${_prefix}add_circle.png";
  static const back = "${_prefix}back.png";
  static const close = "${_prefix}close.png";
  static const coffee = "${_prefix}coffee.png";
  static const edit = "${_prefix}edit.png";
  static const news = "${_prefix}news.png";
  static const settings = "${_prefix}settings.png";
  static const statistics = "${_prefix}statistics.png";
  static const notification = "${_prefix}notification.png";
  static const share = "${_prefix}share.png";
  static const privacy = "${_prefix}privacy.png";
  static const terms = "${_prefix}terms.png";
  static const chevronRight = "${_prefix}chevron_right.png";
}

class MainScreen extends StatefulWidget {
  final String jdnkasdnkja;
  final String mjksdfn;
  final String data;
  final String c1;
  final String c2;

  const MainScreen(
      {super.key,
      required this.jdnkasdnkja,
      required this.mjksdfn,
      required this.data,
      required this.c1,
      required this.c2});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late AppsflyerSdk _appsflyerSdk;
  String idAdv = '';
  String parmFl = '';
  String paramsSecond = '';
  Map _deepLinkData = {};
  Map _gcd = {};
  bool _isFirstLaunch = false;
  String _aStats = '';

  String mxasd = '';
  String rfsdfdsfs = '';

  @override
  Widget build(BuildContext context) {
    final String fsdfdsfds =
        '${widget.jdnkasdnkja}${widget.mjksdfn}$fndsjk${widget.c1}${widget.c2}';
    print(fsdfdsfds);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(fsdfdsfds),
          ),
        ),
      ),
    );
  }
}
