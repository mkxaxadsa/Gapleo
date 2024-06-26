import 'package:coffee_biz/data/models/shop_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox("APP_BOX");
  }

  static late final Box _box;

  static Future<void> setIsNotFirstTimeOpen() async {
    await _box.put("is_first_time_open", false);
  }

  static bool get isFirstTimeOpen {
    return _box.get("is_first_time_open") ?? true;
  }

  static List<ShopModel> get shops {
    final res = List.from(_box.get("shops") ?? [])
        .map(
          (e) => ShopModel.fromMap(Map<String, dynamic>.from(Map.from(e))),
        )
        .toList();
    return res;
  }

  static Future<void> addShop(ShopModel shop) async {
    List<ShopModel> _shops = shops;
    _shops.add(shop);
    await _box.put("shops", _shops.map((e) => e.toMap(),).toList());
  }

  static Future<void> editShop(ShopModel shop) async {
    List<ShopModel> _shops = shops;
    final index = _shops.indexWhere((element) => element.id == shop.id,);
    if(index != -1) {
      _shops[index] = shop;
    }
    await _box.put("shops", _shops.map((e) => e.toMap(),).toList());
  }
}
