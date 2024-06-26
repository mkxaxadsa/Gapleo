// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/core/enums/frequency.dart';

class ShopModel {
  final int id;
  final String title;
  final String description;
  final List<GoodsModel> products;
  final DateTime creationDate;

  int get totalIncome {
    int result = 0;
    for (final item in products) {
      result += item.income;
    }
    return result;
  }

  ShopModel({
    required this.id,
    required this.title,
    required this.description,
    required this.products,
    required this.creationDate,
  });

  factory ShopModel.newShop({
    required String title,
    required String description,
  }) {
    return ShopModel(
      title: title,
      description: description,
      creationDate: DateTime.now(),
      products: [],
      id: DateTime.now().millisecondsSinceEpoch,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'goods': products.map((x) => x.toMap()).toList(),
      'creationDate': creationDate.millisecondsSinceEpoch,
    };
  }

  factory ShopModel.fromMap(Map<String, dynamic> map) {
    return ShopModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      products: List<GoodsModel>.from(
        List.from(map["goods"]??[]).map((e) => GoodsModel.fromMap(Map<String,dynamic>.from(Map.from(e))),).toList()
      ),
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
    );
  }

  ShopModel copyWith({
    int? id,
    String? title,
    String? description,
    List<GoodsModel>? products,
    DateTime? creationDate,
  }) {
    return ShopModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      products: products ?? this.products,
      creationDate: creationDate ?? this.creationDate,
    );
  }
}

class GoodsModel {
  final int id;
  final String name;
  final int price;
  final int quantity;
  final Frequency frequency;

  int get income => price * quantity;

  GoodsModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.frequency,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'frequency': frequency.index,
    };
  }

  factory GoodsModel.fromMap(Map<String, dynamic> map) {
    late final Frequency frequency;
    switch (map['frequency']) {
      case 0:
        frequency = Frequency.weakly;
        break;
      default:
        frequency = Frequency.monthly;
    }
    return GoodsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      quantity: map['quantity'] as int,
      frequency: frequency,
    );
  }

  GoodsModel copyWith({
    int? id,
    String? name,
    int? price,
    int? quantity,
    Frequency? frequency,
  }) {
    return GoodsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      frequency: frequency ?? this.frequency,
    );
  }
}
