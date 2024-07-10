import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:coffee_biz/app/app.dart';
import 'package:coffee_biz/data/helpers/hive_helper.dart';
import 'package:coffee_biz/features/main/settings/data_alerts.dart';
import 'package:coffee_biz/features/welcome/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  fsdfdsfs();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await HiveHelper.init();
  await Notifas().activate();
  kofmsdkfdsflmdsfksd();
  runApp(const CoffeeBizApp());
}

Future<void> kofmsdkfdsflmdsfksd() async {
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
    // setState(() {
    //   mfklsdmfkldsf = res;
    //   modaslmdsa = res['payload']
    //       .entries
    //       .where((e) => ![
    //             'install_time',
    //             'click_time',
    //             'af_status',
    //             'is_first_launch'
    //           ].contains(e.key))
    //       .map((e) => '&${e.key}=${e.value}')
    //       .join();
    //   klmdaslmfdlsa = '&campaign=${res['campaign'] ?? ''}';
    //   lkfosdpfsd = '&media_source=${res['media_source'] ?? ''}';
    // });
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
  fmksdoflsdf.startSDK(
    onSuccess: () {
      print("AppsFlyer SDK initialized successfully.");
    },
  );
}

Future<String> fsdfdsfs() async {
  String mfsdnjkfsd = await AppTrackingTransparency.getAdvertisingIdentifier();
  dsfsdfdsf = mfsdnjkfsd;
  return mfsdnjkfsd;
}
