// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/app/global_navigator/global_navigator.dart';
import 'package:coffee_biz/core/enums/frequency.dart';
import 'package:coffee_biz/core/extensions/capital_first_letter_ext_string.dart';
import 'package:coffee_biz/core/extensions/hidekeyboard_ext_on_context.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/core/ui/app_button.dart';
import 'package:coffee_biz/core/ui/application_bar.dart';
import 'package:coffee_biz/core/ui/switcher_widget.dart';
import 'package:coffee_biz/data/helpers/hive_helper.dart';
import 'package:coffee_biz/features/main/main_screen.dart';
import 'package:flutter/material.dart';

import 'package:coffee_biz/data/models/shop_model.dart';

class AddOrEditGoodsScreen extends StatefulWidget {
  const AddOrEditGoodsScreen({
    super.key,
    required this.shop,
    this.goods,
  });
  final ShopModel shop;
  final GoodsModel? goods;
  @override
  State<AddOrEditGoodsScreen> createState() => _AddOrEditGoodsScreenState();
}

class _AddOrEditGoodsScreenState extends State<AddOrEditGoodsScreen> {
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final quantityCtrl = TextEditingController();
  Frequency frequency = Frequency.weakly;
  bool isLoading = false;
  @override
  void initState() {
    if (widget.goods != null) {
      nameCtrl.text = widget.goods!.name;
      priceCtrl.text = widget.goods!.price.toString();
      quantityCtrl.text = widget.goods!.quantity.toString();
      frequency = widget.goods!.frequency;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.hideKeyboard();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ApplicationBar(
                  centerText: "Add goods",
                  centerSecondaryText: widget.shop.title,
                  onBack: () {
                    Navigator.pop(context);
                  },
                ).paddingSymetric(horizontal: 8).paddingOnly(bottom: 16),
                _itemField(ctrl: nameCtrl, hint: "Name").paddingOnly(bottom: 8),
                _itemField(
                  ctrl: priceCtrl,
                  hint: "Price per piece",
                  keyboardType: TextInputType.number,
                ).paddingOnly(bottom: 8),
                _itemField(
                  ctrl: quantityCtrl,
                  hint: "Quantity",
                  keyboardType: TextInputType.number,
                ).paddingOnly(bottom: 16),
                const Text(
                  'How often will you replenish merchandise?',
                  style: TextStyle(
                    color: Color(0xFF3F4145),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingSymetric(horizontal: 16),
                SwitcherWidget(
                  currentIndex: frequency.index,
                  values: Frequency.values
                      .map(
                        (e) => e.name.makeFirstLetterCapital(),
                      )
                      .toList(),
                  onChange: (p0) {
                    setState(() {
                      frequency = Frequency.values[p0];
                    });
                  },
                ).paddingSymetric(horizontal: 32),
                AppButton(
                  centerText: "Done",
                  onTap: () {
                    if (isLoading) return;
                    isLoading = true;
                    () async {
                      final name = nameCtrl.text.trim();
                      final price = int.tryParse(priceCtrl.text.trim());
                      final quantity = int.tryParse(quantityCtrl.text.trim());

                      if (name.isEmpty || price == null || quantity == null) {
                        return;
                      }
                      if (widget.goods == null) {
                        final goods = GoodsModel(
                          id: DateTime.now().millisecondsSinceEpoch,
                          name: name,
                          price: price,
                          quantity: quantity,
                          frequency: frequency,
                        );

                        final products =
                            List<GoodsModel>.from(widget.shop.products)
                              ..add(goods);
                        final newShop =
                            widget.shop.copyWith(products: products);
                        return HiveHelper.editShop(newShop).then(
                          (value) {
                            GlobalNavigator.pushAndRemoveUntil(context,
                                page: const MainScreen());
                          },
                        );
                      } else {
                        final newGoods = widget.goods!.copyWith(
                          name: name,
                          frequency: frequency,
                          price: price,
                          quantity: quantity,
                        );
                        final index = widget.shop.products.indexWhere(
                          (element) => element.id == newGoods.id,
                        );
                        if (index == -1) return;
                        List<GoodsModel> products =
                            List<GoodsModel>.from(widget.shop.products);
                        products[index] = newGoods;
                        final newShop =
                            widget.shop.copyWith(products: products);
                        return HiveHelper.editShop(newShop).then(
                          (value) {
                            GlobalNavigator.pushAndRemoveUntil(context,
                                page: const MainScreen());
                          },
                        );
                      }
                    }()
                        .then(
                      (value) {
                        isLoading = false;
                      },
                    );
                  },
                ).paddingSymetric(vertical: 30, horizontal: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemField({
    required TextEditingController ctrl,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Color(0xFF3F4145),
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      ),
      controller: ctrl,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFEEE2DA),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0x663F4145),
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
    ).paddingSymetric(horizontal: 16);
  }
}
