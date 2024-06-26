import 'package:coffee_biz/app/app.dart';
import 'package:coffee_biz/data/helpers/hive_helper.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();
  runApp(const CoffeeBizApp());
}
