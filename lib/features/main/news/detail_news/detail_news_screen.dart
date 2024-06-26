// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:flutter/material.dart';

import 'package:coffee_biz/core/extensions/expanded_ext_on_widget.dart';
import 'package:coffee_biz/core/models/news_item_model.dart';
import 'package:coffee_biz/core/ui/application_bar.dart';

class DetailNewsScreen extends StatefulWidget {
  const DetailNewsScreen({
    super.key,
    required this.newsItem,
  });
  final NewsGlob newsItem;
  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              ApplicationBar(
                centerText: "News",
                onBack: () {
                  Navigator.pop(context);
                },
              ).paddingSymetric(horizontal: 8),
              ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: CachedNetworkImage(
                      imageUrl: widget.newsItem.img,
                      cacheKey: widget.newsItem.img,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ).paddingOnly(bottom: 8),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEEE2DA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 98,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFC67C4E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Business',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ).paddingOnly(bottom: 10),
                        Text(
                          widget.newsItem.name,
                          style: const TextStyle(
                            color: Color(0xFFC67C4E),
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ).paddingOnly(bottom: 16),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEEE2DA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      widget.newsItem.description,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ).expanded(),
            ],
          ),
        ),
      ),
    );
  }
}
