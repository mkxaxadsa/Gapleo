// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_biz/app/global_navigator/global_navigator.dart';
import 'package:coffee_biz/core/models/news_item_model.dart';
import 'package:coffee_biz/features/main/news/detail_news/detail_news_screen.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.item,
  });
  final NewsGlob item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GlobalNavigator.push(context, page: DetailNewsScreen(newsItem: item));
      },
      child: SizedBox(
        width: double.maxFinite,
        height: 210,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: item.img,
                  cacheKey: item.img,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.maxFinite,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                color: Colors.black.withOpacity(0.5),
                child: Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 8,
                child: Container(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
