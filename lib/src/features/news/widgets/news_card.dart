import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/fonts.dart';
import '../../../core/models/news.dart';
import '../../../core/widgets/buttons/my_button.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
    this.balanceCard = false,
  });

  final News news;
  final bool balanceCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: balanceCard ? 12 : 22),
      height: 42,
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(42),
              child: CachedNetworkImage(
                imageUrl: news.image,
                height: 42,
                width: 42,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Container();
                },
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: Fonts.w600,
                  ),
                ),
                Text(
                  news.time,
                  style: const TextStyle(
                    color: Color(0xffA7A7A7),
                    fontSize: 10,
                    fontFamily: Fonts.w400,
                  ),
                ),
              ],
            ),
          ),
          MyButton(
            onPressed: () {
              context.push('/news_read', extra: news);
            },
            minSize: 30,
            child: Container(
              height: 30,
              width: 44,
              decoration: BoxDecoration(
                color: const Color(0xff404040),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: Fonts.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
