import 'package:coffee_biz/core/data/news_data.dart';
import 'package:coffee_biz/core/extensions/padding_extension_on_widget.dart';
import 'package:coffee_biz/features/main/news/components/news_item.dart';
import 'package:flutter/widgets.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        bottom: 100,
        left: 16,
        right: 16,
        top: 44,
      ),
      children: [
        const Text(
          'News',
          style: TextStyle(
            color: Color(0xFF3F4145),
            fontSize: 32,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
        ...List.generate(
          newsData.length,
          (index) {
            return NewsItem(item: newsData[index]).paddingOnly(bottom: 8);
          },
        ),
      ],
    );
  }
}
