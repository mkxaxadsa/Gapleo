// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffee_biz/app/global_navigator/global_navigator.dart';
import 'package:coffee_biz/core/extensions/hidekeyboard_ext_on_context.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/core/ui/app_button.dart';
import 'package:coffee_biz/core/ui/application_bar.dart';
import 'package:coffee_biz/data/helpers/hive_helper.dart';
import 'package:coffee_biz/features/main/main_screen.dart';
import 'package:flutter/material.dart';

import 'package:coffee_biz/data/models/shop_model.dart';

class AddOrEditShopScreen extends StatefulWidget {
  const AddOrEditShopScreen({
    super.key,
    this.shop,
  });
  final ShopModel? shop;
  @override
  State<AddOrEditShopScreen> createState() => _AddOrEditShopScreenState();
}

class _AddOrEditShopScreenState extends State<AddOrEditShopScreen> {
  final TextEditingController titleCTRL = TextEditingController();
  final TextEditingController descriptionCTRL = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    if (widget.shop != null) {
      titleCTRL.text = widget.shop!.title;
      descriptionCTRL.text = widget.shop!.description;
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
            child: ListView(
              children: [
                ApplicationBar(
                  onBack: () {
                    Navigator.pop(context);
                  },
                  centerText:
                      "${widget.shop == null ? "Add" : "Edit"} Coffee shop",
                ).paddingSymetric(horizontal: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      style: const TextStyle(
                        color: Color(0xFF3F4145),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                      controller: titleCTRL,
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
                        hintText: "Title",
                        hintStyle: const TextStyle(
                          color: Color(0x663F4145),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ).paddingOnly(bottom: 8),
                    TextField(
                      style: const TextStyle(
                        color: Color(0xFF3F4145),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                      controller: descriptionCTRL,
                      minLines: 4,
                      maxLines: 4,
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
                        hintText: "Description",
                        hintStyle: const TextStyle(
                          color: Color(0x663F4145),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ).paddingOnly(bottom: 16),
                    AppButton(
                      centerText: "Done",
                      onTap: () {
                        if (isLoading) return;
                        isLoading = true;
                        () async {
                          final title = titleCTRL.text.trim();
                          final description = descriptionCTRL.text.trim();
                          if (title.isEmpty || description.isEmpty) return;
                          if (widget.shop == null) {
                            final shop = ShopModel.newShop(
                                title: title, description: description);
                            return HiveHelper.addShop(shop).then(
                              (value) {
                                GlobalNavigator.pushAndRemoveUntil(context,
                                    page: const MainScreen());
                              },
                            );
                          } else {
                            final newShop = widget.shop!
                                .copyWith(title: title, description: description);
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
                    ).paddingOnly(bottom: 16),
                  ],
                ).paddingAll(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
